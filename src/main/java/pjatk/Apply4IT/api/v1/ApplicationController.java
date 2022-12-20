package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.service.OfferService;

import java.io.ByteArrayInputStream;

@RestController
@RequestMapping("/api/v1/applications")
@RequiredArgsConstructor
public class ApplicationController {

    private final OfferService offerService;

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isOfferAuthorByApplicationId(authentication, #offerId))")
    @GetMapping(value = "/{applicationId}/cv", produces = {MediaType.APPLICATION_PDF_VALUE})
    public InputStreamResource get(@PathVariable Integer applicationId) {
        return new InputStreamResource(new ByteArrayInputStream(offerService.getApplicationCv(applicationId)));
    }
}
