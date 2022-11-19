package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import pjatk.Apply4IT.api.v1.dto.OfferFullDto;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.*;

import java.util.Set;
import java.util.stream.Collectors;

@Mapper(
        uses = {CompanyMapper.class}
)
public interface OfferMapper {

    @Mapping(source = "localization", target = "localization", qualifiedByName = "localizationToString")
    @Mapping(source = "categories", target = "categories", qualifiedByName = "categoriesToStrings")
    OfferMinimalDto offerToOfferMinimalDto(Offer offer);

    @Mapping(source = "localization", target = "localization", qualifiedByName = "localizationToString")
    @Mapping(source = "categories", target = "categories", qualifiedByName = "categoriesToStrings")
    @Mapping(source = "applications", target = "applicationsNumber", qualifiedByName = "applicationsToApplicationsNumber")
    @Mapping(source = "expectations", target = "expectations", qualifiedByName = "expectationsToStrings")
    @Mapping(source = "offerAdvantages", target = "offerAdvantages", qualifiedByName = "offerAdvantagesToStrings")
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

    @Named("expectationsToStrings")
    static Set<String> expectationsToStrings(Set<Expectation> expectations) {
        return expectations.stream().map(Expectation::getDescription).collect(Collectors.toSet());
    }

    @Named("offerAdvantagesToStrings")
    static Set<String> offerAdvantagesToStrings(Set<OfferAdvantage> offerAdvantages) {
        return offerAdvantages.stream().map(OfferAdvantage::getDescription).collect(Collectors.toSet());
    }
}
