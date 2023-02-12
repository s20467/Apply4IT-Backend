package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.dto.UserCandidateDto;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface OfferService {
    Page<OfferMinimalDto> getOffers(User currentUser, Specification<Offer> specification, Pageable pageable);
    OfferFullDto getById(Integer offerId, User user);
    Boolean checkIfUserIsOfferAuthor(Integer offerId, String email);
    void saveOffer(Integer offerId, User user);
    void unsaveOffer(Integer offerId, User currentUser);
    void deleteById(Integer offerId);

    void delete(Offer offer);

    Integer createOffer(OfferCreationRequestDto offerCreationDto, User currentUser);
    Integer updateOffer(Integer offerId, OfferCreationRequestDto offerCreationDto);

    void applyForOffer(Integer offerId, MultipartFile cv, User currentUser);

    List<UserCandidateDto> getOfferCandidates(Integer offerId);

    byte[] getApplicationCv(Integer applicationId);

    List<OfferMinimalDto> getUserSavedOffers(String email);

    List<OfferMinimalDto> getAppliedForOffers(String email);

    List<OfferMinimalDto> getUserOffers(String email);
}
