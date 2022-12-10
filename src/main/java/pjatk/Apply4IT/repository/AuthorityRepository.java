package pjatk.Apply4IT.repository;

import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pjatk.Apply4IT.model.Authority;

@Repository
public interface AuthorityRepository extends JpaRepository<Authority, Integer> {

    @EntityGraph(attributePaths = {"users"})
    Authority getByName(String name);
}

