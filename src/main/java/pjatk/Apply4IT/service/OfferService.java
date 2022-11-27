package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

public interface OfferService {
    Page<OfferMinimalDto> getOffers(User currentUser, Specification<Offer> specification, Pageable pageable);
    OfferFullDto getById(Integer offerId, User user);
    Boolean checkIfUserIsOfferAuthor(Integer offerId, String email);
    void saveOffer(Integer offerId, User user);
    void unsaveOffer(Integer offerId, User currentUser);
    void deleteById(Integer offerId);
    Integer createOffer(OfferCreationRequestDto offerCreationDto, User currentUser);
}
