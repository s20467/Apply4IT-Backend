package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.api.v1.dto.OfferCreationRequestDto;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.api.v1.dto.OfferSearchSpecification;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.service.OfferService;
import pjatk.Apply4IT.specification.OfferSpecifications;

import static pjatk.Apply4IT.security.SecurityUtils.getCurrentUser;

@RestController
@RequestMapping("/api/v1/offers")
@RequiredArgsConstructor
public class OfferController {

    private final OfferService offerService;

    @PreAuthorize("permitAll()")
    @PostMapping("/search")
    public Page<OfferMinimalDto> searchOffers(
            @RequestBody(required = false) OfferSearchSpecification offerSearchSpecification,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "creationDate", direction = Sort.Direction.DESC) Pageable pageable
    ) {
        return offerService.getOffers(
                getCurrentUser(),
                OfferSpecifications.searchByOfferSearchSpecification(offerSearchSpecification),
                pageable);
    }

    @PreAuthorize("permitAll()")
    @GetMapping("/{offerId}")
    public OfferFullDto getOfferById(@PathVariable Integer offerId) {
        return offerService.getById(
                offerId,
                getCurrentUser()
        );
    }

    @PreAuthorize("permitAll()")
    @GetMapping("/{offerId}/am-i-author")
    public Boolean checkIfCurrentUserIsOfferAuthor(@PathVariable Integer offerId) {
        User currentUser = getCurrentUser();
        if(currentUser == null) {
            return false;
        }
        return offerService.checkIfUserIsOfferAuthor(
                offerId,
                currentUser.getEmail()
        );
    }

    @PreAuthorize("isFullyAuthenticated()")
    @PostMapping("/{offerId}/save")
    public void saveOffer(@PathVariable Integer offerId) {
        User currentUser = getCurrentUser();
        offerService.saveOffer(offerId, currentUser);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @PostMapping("/{offerId}/unsave")
    public void unsaveOffer(@PathVariable Integer offerId) {
        User currentUser = getCurrentUser();
        offerService.unsaveOffer(offerId, currentUser);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isOfferOwner(authentication, #offerId))")
    @DeleteMapping("/{offerId}")
    public void deleteOffer(@PathVariable Integer offerId) {
        offerService.deleteById(offerId);
    }

    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwnerOrRecruitingFor(authentication, #offerCreationDto.companyId))")
    @PostMapping
    public Integer createOffer(@RequestBody OfferCreationRequestDto offerCreationDto) {
        return offerService.createOffer(offerCreationDto, getCurrentUser());
    }
}
