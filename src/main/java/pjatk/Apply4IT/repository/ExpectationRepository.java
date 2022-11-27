package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Expectation;

public interface ExpectationRepository extends JpaRepository<Expectation, Integer>, JpaSpecificationExecutor<Expectation> {
}
