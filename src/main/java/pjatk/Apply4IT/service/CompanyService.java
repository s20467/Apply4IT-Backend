package pjatk.Apply4IT.service;

import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;

import java.util.List;

public interface CompanyService {

    void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile);

    List<CompanyMinimalDto> getOwnedAndRecruitingFor(User currentUser);
}
