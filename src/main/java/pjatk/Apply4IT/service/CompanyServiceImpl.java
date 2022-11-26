package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.api.v1.mapper.CompanyMapper;
import pjatk.Apply4IT.exception.ImageUploadException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.User;
import pjatk.Apply4IT.repository.CompanyRepository;
import pjatk.Apply4IT.repository.UserRepository;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{

    private final CompanyRepository companyRepository;
    private final UserRepository userRepository;
    private final CompanyMapper companyMapper;

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

    @Override
    @Transactional
    public List<CompanyMinimalDto> getOwnedAndRecruitingFor(User currentUser) {
        User foundUser = userRepository.getByEmail(currentUser.getEmail());

        List<CompanyMinimalDto> resultCompaniesList = new ArrayList<>();

        foundUser.getOwnedCompanies().stream().map(companyMapper::companyToCompanyMinimalDto).forEach(resultCompaniesList::add);
        foundUser.getIsRecruiterFor().stream().map(companyMapper::companyToCompanyMinimalDto).forEach(resultCompaniesList::add);

        return resultCompaniesList;
    }
}
