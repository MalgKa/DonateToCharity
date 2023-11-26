package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation,Long> {
    @Query("SELECT SUM(d.quantity) FROM Donation d" )
    Integer numberOfDonatedBags();

    @Query("SELECT COUNT(d) FROM Donation d")
    Integer numberOfDonations();

    List<Donation> findByInstitution(Institution institution);
}
