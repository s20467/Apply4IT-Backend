package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.OfferAdvantage;

public interface OfferAdvantageRepository extends JpaRepository<OfferAdvantage, Integer>, JpaSpecificationExecutor<OfferAdvantage> {
}
