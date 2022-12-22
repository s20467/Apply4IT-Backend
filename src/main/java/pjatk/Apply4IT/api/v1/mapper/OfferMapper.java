package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.*;

import java.util.Set;
import java.util.stream.Collectors;

@Mapper(
        uses = {CompanyMapper.class, CategoryMapper.class, LocalizationMapper.class},
        injectionStrategy = InjectionStrategy.CONSTRUCTOR
)
public interface OfferMapper {

    @Mapping(source = "localization", target = "localization", qualifiedByName = "localizationToString")
    @Mapping(source = "categories", target = "categories", qualifiedByName = "categoriesToStrings")
    OfferMinimalDto offerToOfferMinimalDto(Offer offer);

    @Mapping(source = "applications", target = "applicationsNumber", qualifiedByName = "applicationsToApplicationsNumber")
    OfferFullDto offerToOfferFullDto(Offer offer);

    @Named("localizationToString")
    static String localizationToString(Localization localization) {
        if(localization == null)
            return null;
        return localization.getName();
    }

    @Named("categoriesToStrings")
    static Set<String> categoriesToStrings(Set<Category> categories) {
        return categories.stream().map(Category::getTitle).collect(Collectors.toSet());
    }

    @Named("applicationsToApplicationsNumber")
    static Integer applicationsToApplicationsNumber(Set<Application> applications) {
        return applications.size();
    }

}
