package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Localization;

public interface LocalizationRepository extends JpaRepository<Localization, Integer>, JpaSpecificationExecutor<Localization> {
}
