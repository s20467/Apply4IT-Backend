package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.api.v1.mapper.CompanyMapper;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.api.v1.mapper.UserMapper;
import pjatk.Apply4IT.exception.ImageUploadException;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.CompanyRepository;
import pjatk.Apply4IT.repository.OfferRepository;
import pjatk.Apply4IT.repository.UserRepository;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;
    private final OfferRepository offerRepository;
    private final CompanyMapper companyMapper;
    private final OfferMapper offerMapper;
    private final UserMapper userMapper;

    @Override
    public void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        try {
            String encodedString = Base64.getEncoder().encodeToString(imageFile.getBytes());
            foundCompany.setLogoPhoto(encodedString);
            companyRepository.save(foundCompany);
        }
        catch(Exception exc) {
            throw new ImageUploadException("Uploading image failed with given message: " + exc.getMessage());
        }
    }

    @Override
    @Transactional
    public List<CompanyMinimalDto> getOwnedAndRecruitingFor(User currentUser) {
        User foundUser = userRepository.getByEmail(currentUser.getEmail());

        List<CompanyMinimalDto> resultCompaniesList = new ArrayList<>();

        foundUser.getOwnedCompanies().stream().map(companyMapper::companyToCompanyMinimalDto).forEach(resultCompaniesList::add);
        foundUser.getIsRecruiterFor().stream().map(companyMapper::companyToCompanyMinimalDto).forEach(resultCompaniesList::add);

        return resultCompaniesList;
    }

    @Override
    public Page<CompanyListItemDto> getAll(Specification<Company> specification, Pageable pageable) {
        return companyRepository.findAll(specification, pageable)
                .map(companyMapper::companyToCompanyListItemDto);
    }

    @Override
    @Transactional
    public CompanyFullDto getById(Integer companyId, User currentUser) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled() && (currentUser == null || !currentUser.isAdmin())) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        CompanyFullDto companyDto = companyMapper.companyToCompanyFullDto(foundCompany);
        companyDto.setIsCurrentUserOwner(false);
        if(currentUser != null && foundCompany.getOwner().getEmail().equals(currentUser.getEmail())) {
            companyDto.setIsCurrentUserOwner(true);
        }
        companyDto.setIsCurrentUserRecruiter(false);
        if(currentUser != null) {
            companyDto.setIsCurrentUserOwner(
                    foundCompany.getRecruiters().stream().anyMatch(
                            user -> user.getEmail().equals(currentUser.getEmail())
                    )
            );
        }
        if(companyDto.getIsCurrentUserOwner() || (currentUser != null && currentUser.isAdmin())) {
            companyDto.setRecruitersSample(
                    foundCompany.getRecruiters().stream()
                            .skip(Math.max(0, foundCompany.getRecruiters().size() - 5))
                            .map(userMapper::userToUserMinimalDto)
                            .collect(Collectors.toSet())
            );
        }
        companyDto.setLatestOffersSample(
                offerRepository.findTop5ByCompanyOrderByCreationDateDesc(foundCompany)
                        .stream().map(offerMapper::offerToOfferMinimalDto)
                        .collect(Collectors.toList())
        );
        if(currentUser != null && (currentUser.isAdmin() || companyDto.getIsCurrentUserOwner())) {
            companyDto.setContactEmail(foundCompany.getContactEmail());
        }
        return companyDto;
    }

    @Override
    @Transactional
    public List<UserMinimalDto> getCompanyRecruiters(Integer companyId) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        return foundCompany.getRecruiters()
                .stream().map(userMapper::userToUserMinimalDto)
                .collect(Collectors.toList());
    }

    @Override
    public void editCompanyDescription(Integer companyId, String description) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        foundCompany.setDescription(description);
        this.companyRepository.save(foundCompany);
    }

    @Override
    public void editCompanyAddress(Integer companyId, Address address) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        foundCompany.setAddress(address);
        this.companyRepository.save(foundCompany);
    }

    @Override
    @Transactional
    public void deleteById(Integer companyId) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        foundCompany.getOffers().forEach(offer -> {
                offer.getAuthor().getCreatedOffers().remove(offer);
                offer.getApplications().forEach(application ->
                        application.getCandidate().getApplications().remove(application)
                );
                offer.getCategories().forEach(category ->
                        category.getOffers().remove(offer)
                );
                offer.getUsersWhoSaved().forEach(user ->
                        user.getSavedOffers().remove(offer)
                );
        });
        foundCompany.getRecruiters().forEach(recruiter ->
                recruiter.getIsRecruiterFor().remove(foundCompany)
        );
//        foundCompany.getOwner().getOwnedCompanies().remove(foundCompany);
        companyRepository.delete(foundCompany);
    }

    @Override
    @Transactional
    public Integer registerCompany(CompanyRegisterRequestDto companyRegisterRequestDto, User currentUser) {
        Company newCompany = companyMapper.companyRegisterRequestDtoToCompany(companyRegisterRequestDto);
        User foundUser = userRepository.getByEmail(currentUser.getEmail());
        newCompany.setOwner(foundUser);
        foundUser.getOwnedCompanies().add(newCompany);
        newCompany.setEnabled(false);
        return companyRepository.save(newCompany).getId();
    }

    @Override
    public void enableCompany(Integer companyId) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(foundCompany.isEnabled()) {
            throw new ResourceConflictException("Company with id: " + companyId + " is already enabled");
        }
        foundCompany.setEnabled(true);
        companyRepository.save(foundCompany);
    }

    @Override
    public Boolean checkIfCompanyNameIsFree(String companyName) {
        return companyRepository.findByNameLower(companyName).isEmpty();
    }

    @Override
    @Transactional
    public void addUserToCompanyRecruiters(Integer companyId, String userEmail) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        User foundUser = userRepository.findByEmail(userEmail.trim()).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        if(foundCompany.getRecruiters().contains(foundUser)) {
            throw new ResourceConflictException("User with email: " + userEmail + " is already recruiter for company with id: " + companyId);
        }
        foundCompany.getRecruiters().add(foundUser);
        foundUser.getIsRecruiterFor().add(foundCompany);
        companyRepository.save(foundCompany);
    }

    @Override
    @Transactional
    public void removeUserFromCompanyRecruiters(Integer companyId, String userEmail) {
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        if(!foundCompany.isEnabled()) {
            throw new ResourceNotFoundException("Company with id: " + companyId + " not found");
        }
        User foundUser = userRepository.findByEmail(userEmail.trim()).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + userEmail + " not found")
        );
        if(!foundCompany.getRecruiters().contains(foundUser)) {
            throw new ResourceConflictException("User with email: " + userEmail + " is not recruiter for company with id: " + companyId);
        }
        foundCompany.getRecruiters().remove(foundUser);
        foundUser.getIsRecruiterFor().remove(foundCompany);
        companyRepository.save(foundCompany);
    }

}
