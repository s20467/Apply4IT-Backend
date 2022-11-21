package pjatk.Apply4IT.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.OfferRepository;

@Component
@RequiredArgsConstructor
public class CustomAuthenticationManager {

    private final OfferRepository offerRepository;

    public boolean isOfferOwner(Authentication authentication, Integer offerId) {
        Offer foundOffer = offerRepository.findById(offerId).orElseThrow(
                () -> new ResourceNotFoundException("Offer with id: " + offerId + " not found")
        );
        User authenticatedUser = (User) authentication.getPrincipal();
        return foundOffer.getAuthor().getEmail().equals(authenticatedUser.getEmail());
    }
}
