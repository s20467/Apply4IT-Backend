package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.service.CompanyService;

@RestController
@RequestMapping("/api/v1/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @PostMapping(value = "/{companyId}/upload-image", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public void uploadCompanyLogoImage(@PathVariable Integer companyId, @RequestParam("image") MultipartFile image) {
        companyService.setCompanyLogoPhoto(companyId, image);
    }
}
