package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.OfferMapper;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.repository.OfferRepository;

@Service
@RequiredArgsConstructor
public class OfferServiceImpl implements OfferService{

    private final OfferRepository offerRepository;
    private final OfferMapper offerMapper;

    @Override
    public Page<OfferMinimalDto> getOffers(Pageable pageable) {
        return offerRepository.findAll(pageable).map(offerMapper::offerToOfferMinimalDto);
    }

    @Override
    public Page<OfferMinimalDto> getOffers(Specification<Offer> specification, Pageable pageable) {
        return offerRepository.findAll(specification, pageable).map(offerMapper::offerToOfferMinimalDto);
    }
}
