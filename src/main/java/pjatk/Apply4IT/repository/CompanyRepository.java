package pjatk.Apply4IT.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Company;

import java.util.List;

public interface CompanyRepository extends JpaRepository<Company, Integer>, JpaSpecificationExecutor<Company> {

    @EntityGraph(
            attributePaths = {"offers"},
            type = EntityGraph.EntityGraphType.LOAD
    )
    Page<Company> findAll(Specification<Company> specification, Pageable pageable);
}
