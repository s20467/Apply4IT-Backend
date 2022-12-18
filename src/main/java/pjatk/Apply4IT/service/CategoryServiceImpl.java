package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.api.v1.mapper.CategoryMapper;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.repository.CategoryRepository;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CategoryServiceImpl implements CategoryService {

    private final CategoryRepository categoryRepository;
    private final CategoryMapper categoryMapper;

    @Override
    public List<CategoryFullDto> getAllCategories() {
        return categoryRepository.findAll().stream().map(categoryMapper::categoryToCategoryFullDto).collect(Collectors.toList());
    }

    @Override
    public void editCategory(CategoryFullDto category) {
        Category foundCategory = categoryRepository.findById(category.getId()).orElseThrow(
                () -> new ResourceNotFoundException("Category with id: " + category.getId() + " not found")
        );
        foundCategory.setTitle(category.getTitle());
        categoryRepository.save(foundCategory);
    }

    @Override
    public void createCategory(CategoryFullDto category) {
        categoryRepository.save(
                new Category(category.getTitle())
        );
    }

    @Override
    @Transactional
    public void deleteById(Integer categoryId) {
        Category foundCategory = categoryRepository.findById(categoryId).orElseThrow(
                () -> new ResourceNotFoundException("Category with id: " + categoryId + " not found")
        );
        foundCategory.getOffers().forEach(offer -> {
            offer.getCategories().remove(foundCategory);
        });
        categoryRepository.delete(foundCategory);
    }
}
