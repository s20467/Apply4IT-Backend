package pjatk.Apply4IT.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.CompanyListItemDto;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface CompanyService {

    void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile);

    List<CompanyMinimalDto> getOwnedAndRecruitingFor(User currentUser);

    Page<CompanyListItemDto> getCompaniesByNameLike(Specification<Company> specification, Pageable pageable);
}
