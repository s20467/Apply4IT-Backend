package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Category;

public interface CategoryRepository extends JpaRepository<Category, Integer>, JpaSpecificationExecutor<Category> {
}
