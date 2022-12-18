package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Education;

public interface EducationRepository extends JpaRepository<Education, Integer>, JpaSpecificationExecutor<Education> {
}
