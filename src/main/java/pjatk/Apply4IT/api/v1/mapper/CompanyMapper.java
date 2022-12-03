package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import pjatk.Apply4IT.api.v1.dto.CompanyFullDto;
import pjatk.Apply4IT.api.v1.dto.CompanyListItemDto;
import pjatk.Apply4IT.api.v1.dto.CompanyMinimalDto;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.model.Offer;

import java.util.Set;

@Mapper
public interface CompanyMapper {


    CompanyFullDto companyToCompanyFullDto(Company company);
    CompanyMinimalDto companyToCompanyMinimalDto(Company company);

    @Mapping(source = "offers", target = "offersNumber", qualifiedByName = "offersToOffersNumber")
    CompanyListItemDto companyToCompanyListItemDto(Company company);

    @Named("offersToOffersNumber")
    static Integer offersToOffersNumber(Set<Offer> offers) {
        return offers.size();
    }

}
