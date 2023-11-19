package pl.coderslab.charity.repository;


import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.entity.User;

public interface UserRepository extends JpaRepository<User,Long> {
    User getByUsername(String username);

    @EntityGraph(type = EntityGraph.EntityGraphType.LOAD, attributePaths = {"userDonations"})
    User getWithDonationsByUsername(String username);
}
