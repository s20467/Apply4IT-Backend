package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.Offer;

public interface OfferService {
    Page<OfferMinimalDto> getOffers(Pageable pageable);
    Page<OfferMinimalDto> getOffers(Specification<Offer> specification, Pageable pageable);
    OfferFullDto getById(Integer offerId);
}
