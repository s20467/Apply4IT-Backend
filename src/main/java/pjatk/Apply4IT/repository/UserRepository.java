package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pjatk.Apply4IT.model.User;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
    Optional<User> findByEmail(String email);
    Optional<User> findUserWithSavedOffersById(Integer id);
    User getByEmail(String email);

    @EntityGraph(attributePaths = {"educations", "experiences"})
    User getWithEducationsAndExperiencesByEmail(String email);

    @EntityGraph(attributePaths = {"savedOffers"})
    User getUserWithSavedOffersByEmail(String email);

    @EntityGraph(attributePaths = {"educations", "experiences"})
    Optional<User> findWithEducationsAndExperiencesByEmail(String userEmail);
}
