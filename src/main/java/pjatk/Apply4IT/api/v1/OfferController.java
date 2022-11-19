package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.dto.OfferSearchSpecification;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.service.OfferService;
import pjatk.Apply4IT.specification.OfferSpecifications;

@RestController
@RequestMapping("/api/v1/offers")
@RequiredArgsConstructor
public class OfferController {

    private final OfferService offerService;

    @PreAuthorize("permitAll()")
    @GetMapping
    public Page<OfferMinimalDto> getOffers(
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return offerService.getOffers(pageable);
    }

    @PreAuthorize("permitAll()")
    @PostMapping("/search")
    public Page<OfferMinimalDto> searchOffers(
            @RequestBody OfferSearchSpecification offerSearchSpecification,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return offerService.getOffers(OfferSpecifications.searchByOfferSearchSpecification(offerSearchSpecification), pageable);
    }

    @PreAuthorize("permitAll()")
    @GetMapping("/{offerId}")
    public OfferFullDto getOfferById(@PathVariable Integer offerId) {
        return offerService.getById(offerId);
    }

    @PreAuthorize("permitAll()")
    @GetMapping("/{offerId}/am-i-author")
    public Boolean checkIfCurrentUserIsOfferAuthor(Integer offerId) {
        User currentUser = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(currentUser == null) {
            return false;
        }
        return offerService.checkIfUserIsOfferAuthor(
                offerId,
                currentUser.getEmail()
        );
    }
}
