package pjatk.Apply4IT.service;

import org.springframework.web.multipart.MultipartFile;

public interface CompanyService {

    void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile);
}
