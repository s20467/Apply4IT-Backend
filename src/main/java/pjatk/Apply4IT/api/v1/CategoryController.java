package pjatk.Apply4IT.api.v1;

import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import pjatk.Apply4IT.api.v1.dto.CategoryFullDto;
import pjatk.Apply4IT.service.CategoryService;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/v1/categories")
@RequiredArgsConstructor
public class CategoryController {

    private final CategoryService categoryService;

    @PreAuthorize("permitAll()")
    @GetMapping
    public List<CategoryFullDto> getAllCategories() {
        return categoryService.getAllCategories();
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PutMapping
    public void editCategory(@RequestBody @Valid CategoryFullDto category) {
        categoryService.editCategory(category);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping
    public void createCategory(@RequestBody @Valid CategoryFullDto category) {
        categoryService.createCategory(category);
    }

    @PreAuthorize("hasRole('ADMIN')")
    @DeleteMapping("/{categoryId}")
    public void deleteCategory(@PathVariable Integer categoryId) {
        categoryService.deleteById(categoryId);
    }
}
