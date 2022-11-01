package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Named;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.model.Company;

@Mapper
public interface CompanyMapper {


    CompanyMinimalDto companyToCompanyMinimalDto(Company company);
}
