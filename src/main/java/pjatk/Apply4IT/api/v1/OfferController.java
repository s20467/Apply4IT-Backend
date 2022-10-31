package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.service.OfferService;
import pjatk.Apply4IT.specification.OfferSpecifications;

@RestController
@RequestMapping("/api/v1/offers")
@RequiredArgsConstructor
public class OfferController {

    private final OfferService offerService;

    @GetMapping
    public Page<OfferMinimalDto> getOffers(
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.ASC) Pageable pageable
    ) {
        return offerService.getOffers(pageable);
    }

    @GetMapping("/{searchString}") // todo maybe different path for search
    public Page<OfferMinimalDto> searchOffers(
            @PathVariable String searchString,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.ASC) Pageable pageable
    ) {
        return offerService.getOffers(OfferSpecifications.search(searchString), pageable);
    }

}
