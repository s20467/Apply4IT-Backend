package pjatk.Apply4IT.service;

import com.codepoetics.protonpack.StreamUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.*;
import pjatk.Apply4IT.repository.*;

import java.time.LocalDate;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@Service
@RequiredArgsConstructor
public class OfferServiceImpl implements OfferService{

    private final OfferRepository offerRepository;
    private final UserRepository userRepository;
    private final CompanyRepository companyRepository;
    private final LocalizationRepository localizationRepository;
    private final CategoryRepository categoryRepository;
    private final OfferMapper offerMapper;

    @Override
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
    public OfferFullDto getById(Integer offerId, User currentUser) {
        Offer foundOffer = offerRepository.findOfferFullDtoBaseById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        OfferFullDto offerDto = offerMapper.offerToOfferFullDto(foundOffer);

        if(currentUser == null) {
            offerDto.setApplicationsNumber(null);
        }
        else {
            User foundUser = userRepository.getUserWithSavedOffersByEmail(currentUser.getEmail());
            offerDto.setIsSavedByCurrentUser(
                    foundUser.getSavedOffers().contains(foundOffer)
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
        foundOffer.getCompany().getOffers().remove(foundOffer);
        foundOffer.getAuthor().getCreatedOffers().remove(foundOffer);
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
        Localization foundLocalization = localizationRepository.findById(offerCreationDto.getLocalizationId()).orElseThrow(
                () -> new ResourceNotFoundException("Localization with id: " + offerCreationDto.getLocalizationId() + " not found")
        );
        Set<Category> categories =
                offerCreationDto.getCategoryIds().stream().map(
                        categoryId -> categoryRepository.findById(categoryId).orElseThrow(
                                () -> new ResourceNotFoundException("Category with id: " + categoryId + " not found")
                        )).collect(Collectors.toSet());
        User foundCurrentUser = userRepository.getByEmail(currentUser.getEmail());
        Set<Expectation> expectations = StreamUtils.zipWithIndex(offerCreationDto.getExpectations().stream())
                .map(indexedExpectation ->
                        Expectation.builder()
                                .description(indexedExpectation.getValue().getDescription())
                                .orderNumber(indexedExpectation.getValue().getOrderNumber())
                                .required(indexedExpectation.getValue().isRequired())
                                .offer(newOffer).build())
                .collect(Collectors.toSet());
        Set<OfferAdvantage> offerAdvantages = StreamUtils.zipWithIndex(offerCreationDto.getOfferAdvantages().stream())
                        .map(indexedOfferAdvantage ->
                                OfferAdvantage.builder()
                                        .description(indexedOfferAdvantage.getValue().getDescription())
                                        .orderNumber(indexedOfferAdvantage.getValue().getOrderNumber())
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
        newOffer.setAuthor(foundCurrentUser);
        newOffer.setExpectations(expectations);
        newOffer.setOfferAdvantages(offerAdvantages);
        newOffer.setCategories(categories);

        foundCompany.getOffers().add(newOffer);
        foundLocalization.getOffers().add(newOffer);
        foundCurrentUser.getCreatedOffers().add(newOffer);
        categories.forEach(category -> category.getOffers().add(newOffer));

        return offerRepository.save(newOffer).getId();
    }
}
