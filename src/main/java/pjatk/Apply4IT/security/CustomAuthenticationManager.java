package pjatk.Apply4IT.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Application;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.ApplicationRepository;
import pjatk.Apply4IT.repository.CompanyRepository;
import pjatk.Apply4IT.repository.OfferRepository;
import pjatk.Apply4IT.repository.UserRepository;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationManager {

    private final OfferRepository offerRepository;
    private final CompanyRepository companyRepository;
    private final ApplicationRepository applicationRepository;
    private final UserRepository userRepository;

    public boolean isOfferOwner(Authentication authentication, Integer offerId) {
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        User authenticatedUser = (User) authentication.getPrincipal();
        return foundOffer.getAuthor().getEmail().equals(authenticatedUser.getEmail());
    }

    @Transactional
    public boolean isCompanyOwnerOrRecruitingFor(Authentication authentication, Integer companyId) {
        User authenticatedUser = (User) authentication.getPrincipal();
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        boolean isRecruiter = foundCompany.getRecruiters().stream().anyMatch(user ->
                authenticatedUser.getEmail().equals(user.getEmail())
        );
        boolean isOwner = foundCompany.getOwner().getEmail().equals(authenticatedUser.getEmail());

        return isRecruiter || isOwner;
    }

    public boolean isOfferAuthor(Authentication authentication, Integer offerId) {
        User authenticatedUser = (User) authentication.getPrincipal();
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        return foundOffer.getAuthor().getEmail().equals(authenticatedUser.getEmail());
    }

    public boolean isCompanyOwner(Authentication authentication, Integer companyId) {
        User authenticatedUser = (User) authentication.getPrincipal();
        Company foundCompany = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );
        return foundCompany.getOwner().getEmail().equals(authenticatedUser.getEmail());
    }

    public boolean isCurrentUser(Authentication authentication, String userEmail) {
        User authenticatedUser = (User) authentication.getPrincipal();
        if(authenticatedUser == null) {
            return false;
        }
        return authenticatedUser.getEmail().equals(userEmail);
    }

    public boolean isOfferAuthorByApplicationId(Authentication authentication, Integer applicationId) {
        User authenticatedUser = (User) authentication.getPrincipal();
        Application foundApplication = applicationRepository.findById(applicationId).orElseThrow(
                () -> new ResourceNotFoundException("Application with id: " + applicationId + " not found")
        );
        Integer offerId = foundApplication.getTargetOffer().getId();
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        return foundOffer.getAuthor().getEmail().equals(authenticatedUser.getEmail());
    }

    @Transactional
    public boolean isRecruiterForAnyUserApplicationTargetOffer(Authentication authentication, String email) {
        User authenticatedUser = (User) authentication.getPrincipal();
        User foundUser = userRepository.findByEmail(email).orElseThrow(
                () -> new ResourceNotFoundException("User with email: " + email + " not found")
        );
        return foundUser.getApplications().stream()
                .map(Application::getTargetOffer)
                .anyMatch(offer -> offer.getAuthor().getEmail().equals(authenticatedUser.getEmail()));
    }
}
