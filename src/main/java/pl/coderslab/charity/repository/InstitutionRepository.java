package pl.coderslab.charity.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.controller.entity.Institution;

public interface InstitutionRepository extends JpaRepository<Institution, Long> {
}
