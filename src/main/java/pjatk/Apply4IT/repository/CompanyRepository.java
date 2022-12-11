package pjatk.Apply4IT.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import pjatk.Apply4IT.model.Company;

import java.util.List;
import java.util.Optional;

public interface CompanyRepository extends JpaRepository<Company, Integer>, JpaSpecificationExecutor<Company> {

    @EntityGraph(
            attributePaths = {"offers"},
            type = EntityGraph.EntityGraphType.LOAD
    )
    Page<Company> findAll(Specification<Company> specification, Pageable pageable);

    @Query("select c from Company c where lower(c.name) = lower(:companyName)")
    Optional<Company> findByNameLower(String companyName);
}
