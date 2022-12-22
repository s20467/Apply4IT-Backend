package pjatk.Apply4IT.service;

import com.codepoetics.protonpack.StreamUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.dto.UserCandidateDto;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.FileUploadException;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.repository.*;

import java.time.LocalDate;
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class OfferServiceImpl implements OfferService{

    private final OfferRepository offerRepository;
    private final UserRepository userRepository;
    private final CompanyRepository companyRepository;
    private final LocalizationRepository localizationRepository;
    private final CategoryRepository categoryRepository;
    private final ApplicationRepository applicationRepository;
    private final OfferMapper offerMapper;
    private final UserMapper userMapper;



    @Override
    @Transactional
    public Page<OfferMinimalDto> getOffers(
            User currentUser,
            Specification<Offer> specification,
            Pageable pageable) {

        Page<Offer> offersPage = offerRepository.findAll(specification, pageable);

        if(currentUser == null) {
            return offersPage.map(offerMapper::offerToOfferMinimalDto);
        }

        User foundUser = userRepository.getUserWithSavedOffersByEmail(currentUser.getEmail());
        return offersPage.map((offer) -> {
            OfferMinimalDto offerDto = offerMapper.offerToOfferMinimalDto(offer);
            offerDto.setIsSavedByCurrentUser(foundUser.getSavedOffers().contains(offer));
            return offerDto;
        });
    }


    @Override
    @Transactional
    public List<OfferMinimalDto> getUserSavedOffers(String email) {
        User foundUser = userRepository.getByEmail(email);
        return foundUser.getSavedOffers().stream()
                .sorted(Comparator.comparing(Offer::getCreationDate))
                .map(offer -> {
                    OfferMinimalDto offerMinimalDto = offerMapper.offerToOfferMinimalDto(offer);
                    offerMinimalDto.setIsSavedByCurrentUser(true);
                    return offerMinimalDto;
                }).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<OfferMinimalDto> getAppliedForOffers(String email) {
        User foundUser = userRepository.getByEmail(email);
        return foundUser.getApplications().stream()
                .map(Application::getTargetOffer)
                .sorted(Comparator.comparing(Offer::getCreationDate))
                .map(offer -> {
                    OfferMinimalDto offerMinimalDto = offerMapper.offerToOfferMinimalDto(offer);
                    offerMinimalDto.setIsSavedByCurrentUser(foundUser.getSavedOffers().contains(offer));
                    return offerMinimalDto;
                }).collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<OfferMinimalDto> getUserOffers(String email) {
        User foundUser = userRepository.getByEmail(email);
        return foundUser.getCreatedOffers().stream()
                .sorted(Comparator.comparing(Offer::getCreationDate))
                .map(offer -> {
                    OfferMinimalDto offerMinimalDto = offerMapper.offerToOfferMinimalDto(offer);
                    offerMinimalDto.setIsSavedByCurrentUser(foundUser.getSavedOffers().contains(offer));
                    return offerMinimalDto;
                }).collect(Collectors.toList());
    }

    @Override
    public OfferFullDto getById(Integer offerId, User currentUser) {
        Offer foundOffer = offerRepository.findOfferFullDtoBaseById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        OfferFullDto offerDto = offerMapper.offerToOfferFullDto(foundOffer);

        if(currentUser == null) {
            offerDto.setApplicationsNumber(null);
            offerDto.setHasCurrentUserApplied(null);
        }
        else {
            User foundUser = userRepository.getUserWithSavedOffersByEmail(currentUser.getEmail());
            offerDto.setIsSavedByCurrentUser(
                    foundUser.getSavedOffers().contains(foundOffer)
            );
            offerDto.setHasCurrentUserApplied(
                    applicationRepository.findByTargetOfferAndCandidate(foundOffer, foundUser).isPresent()
            );
        }
        return offerDto;
    }

    @Override
    public Boolean checkIfUserIsOfferAuthor(Integer offerId, String email) {
        return offerRepository.existsByIdAndAuthor_Email(offerId, email);
    }

    @Override
    @Transactional
    public void saveOffer(Integer offerId, User currentUser) {
        User foundUser = userRepository.getByEmail(currentUser.getEmail());
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        if(foundUser.getSavedOffers().contains(foundOffer)) {
            throw new ResourceConflictException("Offer with id: " + offerId + " already saved by user with email: " + currentUser.getEmail());
        }
        foundOffer.getUsersWhoSaved().add(foundUser);
        foundUser.getSavedOffers().add(foundOffer);
        offerRepository.save(foundOffer);
    }

    @Override
    @Transactional
    public void unsaveOffer(Integer offerId, User currentUser) {
        User foundUser = userRepository.getByEmail(currentUser.getEmail());
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        if(!foundUser.getSavedOffers().contains(foundOffer)) {
            throw new ResourceConflictException("Offer with id: " + offerId + " is not saved by user with email: " + currentUser.getEmail());
        }
        foundOffer.getUsersWhoSaved().remove(foundUser);
        foundUser.getSavedOffers().remove(foundOffer);
        offerRepository.save(foundOffer);
    }

    @Override
    @Transactional
    public void deleteById(Integer offerId) {
        Offer foundOffer = offerRepository.findOfferFullDtoBaseById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
//        foundOffer.getCompany().getOffers().remove(foundOffer);
//        foundOffer.getAuthor().getCreatedOffers().remove(foundOffer);
        foundOffer.getApplications().forEach((Application application) ->
            application.getCandidate().getApplications().remove(application)
        );
        foundOffer.getCategories().forEach((Category category) ->
                category.getOffers().remove(foundOffer));
        foundOffer.getUsersWhoSaved().forEach((User user) ->
                user.getSavedOffers().remove(foundOffer));

        offerRepository.delete(foundOffer);
    }

    @Override
    @Transactional
    public Integer createOffer(OfferCreationRequestDto offerCreationDto, User currentUser) {
        Offer newOffer = new Offer();
        Company foundCompany = companyRepository.findById(offerCreationDto.getCompanyId()).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + offerCreationDto.getCompanyId() + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + offerCreationDto.getCompanyId() + " not found");
        }
        Localization foundLocalization = localizationRepository.findById(offerCreationDto.getLocalizationId()).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + offerCreationDto.getLocalizationId() + " not found")
        );
        Set<Category> categories =
                offerCreationDto.getCategoryIds().stream().map(
                        categoryId -> categoryRepository.findById(categoryId).orElseThrow(
                                () -> new ResourceNotFoundException("Category with id: " + categoryId + " not found")
                        )).collect(Collectors.toSet());
        Set<Expectation> expectations = offerCreationDto.getExpectations().stream().map(
                expectation -> Expectation.builder()
                        .description(expectation.getDescription())
                        .orderNumber(expectation.getOrderNumber())
                        .required(expectation.isRequired())
                        .offer(newOffer).build())
                .collect(Collectors.toSet());
        Set<OfferAdvantage> offerAdvantages = offerCreationDto.getOfferAdvantages().stream().map(
                offerAdvantage -> OfferAdvantage.builder()
                        .description(offerAdvantage.getDescription())
                        .orderNumber(offerAdvantage.getOrderNumber())
                        .offer(newOffer).build())
                .collect(Collectors.toSet());
        boolean remotePossibility = offerCreationDto.getRemotePossibility() == null ? false : offerCreationDto.getRemotePossibility();
        boolean firstJobPossibility = offerCreationDto.getFirstJobPossibility() == null ? false : offerCreationDto.getFirstJobPossibility();


        newOffer.setTitle(offerCreationDto.getTitle());
        newOffer.setDescription(offerCreationDto.getDescription());
        newOffer.setAddress(offerCreationDto.getAddress());
        newOffer.setLocalization(foundLocalization);
        newOffer.setCompany(foundCompany);
        newOffer.setCreationDate(LocalDate.now());
        newOffer.setClosingDate(offerCreationDto.getClosingDate());
        newOffer.setMinSalaryPln(offerCreationDto.getMinSalaryPln());
        newOffer.setMaxSalaryPln(offerCreationDto.getMaxSalaryPln());
        newOffer.setFirstJobPossibility(firstJobPossibility);
        newOffer.setRemotePossibility(remotePossibility);
        newOffer.setExpectations(expectations);
        newOffer.setOfferAdvantages(offerAdvantages);
        newOffer.setCategories(categories);

        foundCompany.getOffers().add(newOffer);
        foundLocalization.getOffers().add(newOffer);
        categories.forEach(category -> category.getOffers().add(newOffer));
        User foundCurrentUser = userRepository.getByEmail(currentUser.getEmail());
        newOffer.setAuthor(foundCurrentUser);
        foundCurrentUser.getCreatedOffers().add(newOffer);

        return offerRepository.save(newOffer).getId();
    }

    @Override
    @Transactional
    public Integer updateOffer(Integer offerId, OfferCreationRequestDto offerCreationDto) {
        Offer updatedOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        Company foundCompany = companyRepository.findById(offerCreationDto.getCompanyId()).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + offerCreationDto.getCompanyId() + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + offerCreationDto.getCompanyId() + " not found");
        }
        Localization foundLocalization = localizationRepository.findById(offerCreationDto.getLocalizationId()).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + offerCreationDto.getLocalizationId() + " not found")
        );
        Set<Category> categories =
                offerCreationDto.getCategoryIds().stream().map(
                        categoryId -> categoryRepository.findById(categoryId).orElseThrow(
                                () -> new ResourceNotFoundException("Category with id: " + categoryId + " not found")
                        )).collect(Collectors.toSet());
        Set<Expectation> expectations = offerCreationDto.getExpectations().stream().map(
                expectation -> Expectation.builder()
                        .description(expectation.getDescription())
                        .orderNumber(expectation.getOrderNumber())
                        .required(expectation.isRequired())
                        .offer(updatedOffer).build())
                .collect(Collectors.toSet());
        Set<OfferAdvantage> offerAdvantages = offerCreationDto.getOfferAdvantages().stream().map(
                offerAdvantage -> OfferAdvantage.builder()
                        .description(offerAdvantage.getDescription())
                        .orderNumber(offerAdvantage.getOrderNumber())
                        .offer(updatedOffer).build())
                .collect(Collectors.toSet());
        boolean remotePossibility = offerCreationDto.getRemotePossibility() == null ? false : offerCreationDto.getRemotePossibility();
        boolean firstJobPossibility = offerCreationDto.getFirstJobPossibility() == null ? false : offerCreationDto.getFirstJobPossibility();


        updatedOffer.setTitle(offerCreationDto.getTitle());
        updatedOffer.setDescription(offerCreationDto.getDescription());
        updatedOffer.setAddress(offerCreationDto.getAddress());
        if(foundLocalization != updatedOffer.getLocalization()) {
            updatedOffer.getLocalization().getOffers().remove(updatedOffer);
            foundLocalization.getOffers().add(updatedOffer);
        }
        updatedOffer.setLocalization(foundLocalization);
        if(foundCompany != updatedOffer.getCompany()) {
            updatedOffer.getCompany().getOffers().remove(updatedOffer);
            foundCompany.getOffers().add(updatedOffer);
        }
        updatedOffer.setCompany(foundCompany);
        updatedOffer.setClosingDate(offerCreationDto.getClosingDate());
        updatedOffer.setMinSalaryPln(offerCreationDto.getMinSalaryPln());
        updatedOffer.setMaxSalaryPln(offerCreationDto.getMaxSalaryPln());
        updatedOffer.setFirstJobPossibility(firstJobPossibility);
        updatedOffer.setRemotePossibility(remotePossibility);
        updatedOffer.getExpectations().removeAll(updatedOffer.getExpectations());
        updatedOffer.getExpectations().addAll(expectations);
//        updatedOffer.setExpectations(expectations);
        updatedOffer.getOfferAdvantages().removeAll(updatedOffer.getOfferAdvantages());
        updatedOffer.getOfferAdvantages().addAll(offerAdvantages);
//        updatedOffer.setOfferAdvantages(offerAdvantages);
        updatedOffer.getCategories().forEach(category -> category.getOffers().remove(updatedOffer));
        updatedOffer.setCategories(categories);
        categories.forEach(category -> category.getOffers().add(updatedOffer));

        return offerRepository.save(updatedOffer).getId();
    }

    @Override
    @Transactional
    public void applyForOffer(Integer offerId, MultipartFile cv, User currentUser) {
        User applyingUser = userRepository.getByEmail(currentUser.getEmail());
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        if(applicationRepository.findByTargetOfferAndCandidate(foundOffer, applyingUser).isPresent()) {
            throw new ResourceConflictException("User already applied for this offer");
        }
        try {
            Application newApplication = Application.builder()
                    .applicationDate(LocalDate.now())
                    .cv(cv == null ? null : wrapBytesArray(cv.getBytes()))
                    .targetOffer(foundOffer)
                    .candidate(applyingUser)
                    .build();
            applyingUser.getApplications().add(newApplication);
            foundOffer.getApplications().add(newApplication);
            applicationRepository.save(newApplication);
        }
        catch(Exception exc) {
            throw new FileUploadException("Uploading cv failed with given message: " + exc.getMessage());
        }
    }

    @Override
    @Transactional
    public List<UserCandidateDto> getOfferCandidates(Integer offerId) {
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        return foundOffer.getApplications().stream().map(application -> {
            UserCandidateDto userCandidateDto = userMapper.userToUserCandidateDto(application.getCandidate());
            userCandidateDto.setUserId(application.getCandidate().getId());
            userCandidateDto.setApplicationId(application.getId());
            userCandidateDto.setHasCv(application.getCv() != null);
            return userCandidateDto;
        }).collect(Collectors.toList());
    }

    @Override
    public byte[] getApplicationCv(Integer applicationId) {
        Application foundApplication = applicationRepository.findById(applicationId).orElseThrow(
                () -> new ResourceNotFoundException("Application with id: " + applicationId + " not found")
        );
        return unwrapBytesArray(foundApplication.getCv());
    }


    Offer updateOfferWithOfferCreationRequestDto(Offer updatedOffer, OfferCreationRequestDto offerDto, boolean editMode) {
        Company foundCompany = companyRepository.findById(offerDto.getCompanyId()).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + offerDto.getCompanyId() + " not found")
        );
        Localization foundLocalization = localizationRepository.findById(offerDto.getLocalizationId()).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + offerDto.getLocalizationId() + " not found")
        );
        Set<Category> categories =
                offerDto.getCategoryIds().stream().map(
                        categoryId -> categoryRepository.findById(categoryId).orElseThrow(
                                () -> new ResourceNotFoundException("Category with id: " + categoryId + " not found")
                        )).collect(Collectors.toSet());
        Set<Expectation> expectations = StreamUtils.zipWithIndex(offerDto.getExpectations().stream())
                .map(indexedExpectation ->
                        Expectation.builder()
                                .description(indexedExpectation.getValue().getDescription())
                                .orderNumber(indexedExpectation.getValue().getOrderNumber())
                                .required(indexedExpectation.getValue().isRequired())
                                .offer(updatedOffer).build())
                .collect(Collectors.toSet());
        Set<OfferAdvantage> offerAdvantages = StreamUtils.zipWithIndex(offerDto.getOfferAdvantages().stream())
                .map(indexedOfferAdvantage ->
                        OfferAdvantage.builder()
                                .description(indexedOfferAdvantage.getValue().getDescription())
                                .orderNumber(indexedOfferAdvantage.getValue().getOrderNumber())
                                .offer(updatedOffer).build())
                .collect(Collectors.toSet());
        boolean remotePossibility = offerDto.getRemotePossibility() == null ? false : offerDto.getRemotePossibility();
        boolean firstJobPossibility = offerDto.getFirstJobPossibility() == null ? false : offerDto.getFirstJobPossibility();


        updatedOffer.setTitle(offerDto.getTitle());
        updatedOffer.setDescription(offerDto.getDescription());
        updatedOffer.setAddress(offerDto.getAddress());
        updatedOffer.setLocalization(foundLocalization);
        updatedOffer.setCompany(foundCompany);
        updatedOffer.setCreationDate(LocalDate.now());
        updatedOffer.setClosingDate(offerDto.getClosingDate());
        updatedOffer.setMinSalaryPln(offerDto.getMinSalaryPln());
        updatedOffer.setMaxSalaryPln(offerDto.getMaxSalaryPln());
        updatedOffer.setFirstJobPossibility(firstJobPossibility);
        updatedOffer.setRemotePossibility(remotePossibility);
        updatedOffer.setExpectations(expectations);
        updatedOffer.setOfferAdvantages(offerAdvantages);
        updatedOffer.setCategories(categories);

        foundCompany.getOffers().add(updatedOffer);
        foundLocalization.getOffers().add(updatedOffer);
        categories.forEach(category -> category.getOffers().add(updatedOffer));

        return updatedOffer;
    }



    private Byte[] wrapBytesArray(byte[] bytes) {
        Byte[] wrappedBytes = new Byte[bytes.length];
        int i=0;
        for(byte b: bytes) {
            wrappedBytes[i++] = b;
        }
        return wrappedBytes;
    }

    private byte[] unwrapBytesArray(Byte[] bytes) {
        byte[] unwrappedBytes = new byte[bytes.length];
        int i=0;
        for(Byte b: bytes) {
            unwrappedBytes[i++] = b;
        }
        return unwrappedBytes;
    }
}
