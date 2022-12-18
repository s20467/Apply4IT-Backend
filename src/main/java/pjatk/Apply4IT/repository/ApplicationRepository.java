package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pjatk.Apply4IT.model.Application;
import pjatk.Apply4IT.model.Offer;
import pjatk.Apply4IT.model.User;

import java.util.Optional;

@Repository
public interface ApplicationRepository extends JpaRepository<Application, Integer> {

    Optional<Application> findByTargetOfferAndCandidate(Offer offer, User candidate);
}

