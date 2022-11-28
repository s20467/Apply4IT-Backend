package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.service.CompanyService;
import pjatk.Apply4IT.specification.CompanySpecifications;
import pjatk.Apply4IT.specification.OfferSpecifications;

import java.util.List;

import static pjatk.Apply4IT.security.SecurityUtils.getCurrentUser;

@RestController
@RequestMapping("/api/v1/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @PreAuthorize("permitAll()")
    @PostMapping("/search")
    public Page<CompanyListItemDto> searchCompaniesByName(
            @RequestBody(required = false) CompanySearchSpecification companySearchSpecification,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "name", direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Specification<Company> specification = companySearchSpecification == null ?
                Specification.where(null) : CompanySpecifications.likeName(companySearchSpecification.getNameLike());
        return companyService.getCompaniesByNameLike(
                specification,
                pageable);
    }

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
