package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.service.CompanyService;

import java.util.List;

import static pjatk.Apply4IT.security.SecurityUtils.getCurrentUser;

@RestController
@RequestMapping("/api/v1/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @PostMapping(value = "/{companyId}/upload-image", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE}) //todo secure
    public void uploadCompanyLogoImage(@PathVariable Integer companyId, @RequestParam("image") MultipartFile image) {
        companyService.setCompanyLogoPhoto(companyId, image);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @GetMapping("owned-and-recruiting-for")
    public List<CompanyMinimalDto> getOwnedAndRecruitingForCompanies() {
        User currentUser = getCurrentUser();
        return companyService.getOwnedAndRecruitingFor(currentUser);
    }
}
