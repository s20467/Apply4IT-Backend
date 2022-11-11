package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.exception.ImageUploadException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.repository.CompanyRepository;

import java.util.Base64;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final CompanyRepository companyRepository;

    @Override
    public void setCompanyLogoPhoto(Integer companyId, MultipartFile imageFile) {
        Company company = companyRepository.findById(companyId).orElseThrow(
                () -> new ResourceNotFoundException("Company with id: " + companyId + " not found")
        );

        try {
            String encodedString = Base64.getEncoder().encodeToString(imageFile.getBytes());
            company.setLogoPhoto(encodedString);
            companyRepository.save(company);
        }
        catch(Exception exc) {
            throw new ImageUploadException("Uploading image failed with given message: " + exc.getMessage());
        }
    }
}
