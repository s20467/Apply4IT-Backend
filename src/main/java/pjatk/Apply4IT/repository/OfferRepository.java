package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import pjatk.Apply4IT.model.Offer;

import java.util.Optional;

public interface OfferRepository extends JpaRepository<Offer, Integer>, JpaSpecificationExecutor<Offer> {

    @EntityGraph(
            attributePaths = {"expectations", "offerAdvantages", "categories", "applications"},
            type = EntityGraph.EntityGraphType.LOAD
    )
    Optional<Offer> findOfferFullDtoBaseById(Integer id);
    Boolean existsByIdAndAuthor_Email(Integer id, String email);
}
