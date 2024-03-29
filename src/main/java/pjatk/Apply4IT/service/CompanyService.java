package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.*;
import pjatk.Apply4IT.model.Address;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface CompanyService {

    void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile);

    List<CompanyMinimalDto> getEnabledOwnedAndRecruitingFor(User currentUser);

    Page<CompanyListItemDto> getAll(Specification<Company> specification, Pageable pageable);

    CompanyFullDto getById(Integer companyId, User currentUser);

    void removeUserFromCompanyRecruiters(Integer companyId, String userEmail);

    void addUserToCompanyRecruiters(Integer companyId, String userEmail);

    List<UserMinimalDto> getCompanyRecruiters(Integer companyId);

    void editCompanyDescription(Integer companyId, String Description);

    void editCompanyAddress(Integer companyId, Address address);

    void deleteById(Integer companyId);

    Integer registerCompany(CompanyRegisterRequestDto companyRegisterRequestDto, User currentUser);

    void enableCompany(Integer companyId);

    Boolean checkIfCompanyNameIsFree(String companyName);

    List<CompanyListItemDto> getEnabledOwnedCompanies(User currentUser);
}
