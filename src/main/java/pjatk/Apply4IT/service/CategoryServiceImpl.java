package pjatk.Apply4IT.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.api.v1.mapper.CategoryMapper;
import pjatk.Apply4IT.exception.ImageUploadException;
import pjatk.Apply4IT.exception.ResourceNotFoundException;
import pjatk.Apply4IT.model.Category;
import pjatk.Apply4IT.model.Company;
import pjatk.Apply4IT.repository.CategoryRepository;
import pjatk.Apply4IT.repository.CompanyRepository;

import java.util.Base64;
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
}
