package pjatk.Apply4IT.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.CompanyRepository;
import pjatk.Apply4IT.repository.OfferRepository;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationManager {

    private final OfferRepository offerRepository;
    private final CompanyRepository companyRepository;

    public boolean isOfferOwner(Authentication authentication, Integer offerId) {
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        User authenticatedUser = (User) authentication.getPrincipal();
        return foundOffer.getAuthor().getEmail().equals(authenticatedUser.getEmail());
    }

    @Transactional
    public boolean getIsCompanyOwnerOrRecruitingFor(Authentication authentication, Integer companyId) {
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
}
