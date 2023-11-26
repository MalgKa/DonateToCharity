package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;

import java.util.List;
import java.util.Set;

public interface DonationRepository extends JpaRepository<Donation,Long> {
    @Query("SELECT SUM(d.quantity) FROM Donation d" )
    Integer numberOfDonatedBags();

    @Query("SELECT COUNT(d) FROM Donation d")
    Integer numberOfDonations();

    List<Donation> findByInstitution(Institution institution);

    @Query(value="select * from donation join user_donation ud on donation.id = ud.donation_id where user_id= :userId order by donation.pick_up_date",nativeQuery = true)
    List<Donation> findAllByUserIdOrderByPickupDate(Long userId);
}
