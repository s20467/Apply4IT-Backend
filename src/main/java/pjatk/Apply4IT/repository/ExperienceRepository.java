package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Experience;

public interface ExperienceRepository extends JpaRepository<Experience, Integer>, JpaSpecificationExecutor<Experience> {
}
