package pjatk.Apply4IT.service;

import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.model.Category;

import java.util.List;

public interface CategoryService {

    List<CategoryFullDto> getAllCategories();
}
