package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.dto.OfferSearchSpecification;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.service.OfferService;
import pjatk.Apply4IT.specification.OfferSpecifications;

@RestController
@RequestMapping("/api/v1/offers")
@RequiredArgsConstructor
public class OfferController {

    private final OfferService offerService;

    @GetMapping
    public Page<OfferMinimalDto> getOffers(
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return offerService.getOffers(pageable);
    }

    @PostMapping("/search")
    public Page<OfferMinimalDto> searchOffers(
            @RequestBody OfferSearchSpecification offerSearchSpecification,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return offerService.getOffers(OfferSpecifications.searchByOfferSearchSpecification(offerSearchSpecification), pageable);
    }

    @GetMapping("/{offerId}")
    public OfferFullDto getOfferById(@PathVariable Integer offerId) {
        return offerService.getById(offerId);
    }
}
