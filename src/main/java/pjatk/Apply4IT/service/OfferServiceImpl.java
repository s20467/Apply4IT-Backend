package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.Offer;

@Service
public class OfferServiceImpl implements OfferService{
    @Override
    public Page<OfferMinimalDto> getOffers(Pageable pageable) {
        return null; // todo implement
    }

    @Override
    public Page<OfferMinimalDto> getOffers(Pageable pageable, Specification<Offer> specification) {
        return null; // todo implement
    }
}
