package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.parameters.P;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.service.CompanyService;
import pjatk.Apply4IT.specification.CompanySpecifications;

import java.util.List;
import java.util.Map;

import static pjatk.Apply4IT.security.SecurityUtils.getCurrentUser;

@RestController
@RequestMapping("/api/v1/companies")
@RequiredArgsConstructor
public class CompanyController {

    private final CompanyService companyService;

    @PreAuthorize("permitAll()")
    @GetMapping("/{companyId}/details")
    public CompanyFullDto getCompanyById(@PathVariable Integer companyId) {
        return companyService.getById(companyId, getCurrentUser());
    }

    @PreAuthorize("permitAll()")
    @PostMapping("/search")
    public Page<CompanyListItemDto> searchCompaniesByName(
            @RequestBody(required = false) CompanySearchSpecification companySearchSpecification,
            @PageableDefault(size = 10, page = 0) @SortDefault(sort = "name", direction = Sort.Direction.ASC) Pageable pageable
    ) {
        Specification<Company> specification;
        if(companySearchSpecification == null) {
            specification = Specification.where(null);
        }
        else if(!companySearchSpecification.getEnabledEqual() && getCurrentUser() == null) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED);
        }
        else if(!companySearchSpecification.getEnabledEqual() && !getCurrentUser().isAdmin()) {
            throw new ResponseStatusException(HttpStatus.FORBIDDEN);
        }
        else {
            specification = CompanySpecifications.likeName(companySearchSpecification.getNameLike())
                    .and(CompanySpecifications.enabledEqual(companySearchSpecification.getEnabledEqual()));
        }
        return companyService.getAll(specification, pageable);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @PostMapping(value = "/{companyId}/upload-image", consumes = {MediaType.MULTIPART_FORM_DATA_VALUE})
    public void uploadCompanyLogoImage(@PathVariable Integer companyId, @RequestParam("logo") MultipartFile image) {
        companyService.setCompanyLogoPhoto(companyId, image);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @GetMapping("owned-and-recruiting-for")
    public List<CompanyMinimalDto> getOwnedAndRecruitingForCompanies() {
        return companyService.getOwnedAndRecruitingFor(getCurrentUser());
    }

    @PreAuthorize("isFullyAuthenticated()")
    @GetMapping("owned")
    public List<CompanyListItemDto> getOwnedCompanies() {
        return companyService.getOwnedCompanies(getCurrentUser());
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @GetMapping("{companyId}/recruiters")
    public List<UserMinimalDto> removeUserFromCompanyRecruiters(@PathVariable Integer companyId) {
        return companyService.getCompanyRecruiters(companyId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @DeleteMapping("{companyId}/recruiters/{userEmail}")
    public void removeUserFromCompanyRecruiters(@PathVariable Integer companyId, @PathVariable String userEmail) {
        companyService.removeUserFromCompanyRecruiters(companyId, userEmail);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @PostMapping("{companyId}/recruiters/{userEmail}")
    public void addUserToCompanyRecruiters(@PathVariable Integer companyId, @PathVariable String userEmail) {
        companyService.addUserToCompanyRecruiters(companyId, userEmail);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @PostMapping("{companyId}/edit-description") //todo change to put
    public void editCompanyDescription(@PathVariable Integer companyId, @RequestBody Map<String, String> body) {
        String description = body.get("description");
        if(description == null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid request body - does not contain description field");
        }
        companyService.editCompanyDescription(companyId, description);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @PostMapping("{companyId}/edit-address") //todo change to put
    public void editCompanyAddress(@PathVariable Integer companyId, @RequestBody Address address) {
        companyService.editCompanyAddress(companyId, address);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @PostMapping("register")
    public Integer registerCompany(@RequestBody CompanyRegisterRequestDto companyRegisterRequestDto) {
        return companyService.registerCompany(companyRegisterRequestDto, getCurrentUser());
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping("{companyId}/enable")
    public void enableCompany(@PathVariable Integer companyId) {
        companyService.enableCompany(companyId);
    }

    @PreAuthorize("hasRole('ADMIN') or (hasRole('USER') and @customAuthenticationManager.isCompanyOwner(authentication, #companyId))")
    @DeleteMapping("{companyId}")
    public void deleteCompany(@PathVariable Integer companyId) {
        companyService.deleteById(companyId);
    }

    @PreAuthorize("isFullyAuthenticated()")
    @GetMapping("{companyName}/is-name-free")
    public Boolean checkIfCompanyNameIsFree(@PathVariable String companyName) {
        return companyService.checkIfCompanyNameIsFree(companyName);
    }
}
