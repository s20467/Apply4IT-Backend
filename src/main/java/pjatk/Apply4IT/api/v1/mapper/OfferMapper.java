package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Named;
import pjatk.Apply4IT.api.v1.dto.OfferMinimalDto;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.Offer;

@Mapper
public interface OfferMapper {

    @Mapping(source = "categories", target = "categories", qualifiedByName = "categoryToString")
    OfferMinimalDto offerToOfferMinimalDto(Offer offer);

    @Named("categoryToString")
    static String categoryToString(Category category) {
        return category.getTitle();
    }
}
