package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Localization;

import java.util.Optional;

public interface LocalizationRepository extends JpaRepository<Localization, Integer>, JpaSpecificationExecutor<Localization> {

    @EntityGraph(
            attributePaths = {"offers"},
            type = EntityGraph.EntityGraphType.LOAD
    )
    Optional<Localization> findWithOffersById(Integer offerId);
}
