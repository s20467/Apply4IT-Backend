package pjatk.Apply4IT.api.v1.mapper;

import org.mapstruct.Mapper;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.model.Category;

@Mapper
public interface CategoryMapper {

    CategoryFullDto categoryToCategoryFullDto(Category category);
}
