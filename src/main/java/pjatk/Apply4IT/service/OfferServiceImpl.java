package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.exception.ResourceConflictException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.OfferRepository;
import pjatk.Apply4IT.repository.UserRepository;

@Service
@RequiredArgsConstructor
public class OfferServiceImpl implements OfferService{

    private final OfferRepository offerRepository;
    private final UserRepository userRepository;
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

        if(currentUser != null) {
            User foundUser = userRepository.getUserWithSavedOffersByEmail(currentUser.getEmail());
            offerDto.setIsSavedByCurrentUser(
                    foundUser.getSavedOffers().contains(foundOffer)
            );
            if(!foundOffer.getAuthor().equals(foundUser)) {
                offerDto.setApplicationsNumber(null);
            }
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
}
