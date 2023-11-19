package pl.coderslab.charity.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository, UserRepository userRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userRepository = userRepository;
    }

    @RequestMapping("/")
    public String homeAction(@AuthenticationPrincipal UserDetails authenticatedUser, Model model) {
        List<Institution> institutionList = institutionRepository.findAll();
        Integer numberOfBags = donationRepository.numberOfDonatedBags();
        Integer numberOfDonations = donationRepository.numberOfDonations();
        model.addAttribute("numberOfDonations", numberOfDonations);
        model.addAttribute("institutionList", institutionList);
        model.addAttribute("numberOfBags", numberOfBags);

        if (authenticatedUser != null) {
            User loggedUser = userRepository.getByUsername(authenticatedUser.getUsername());
            model.addAttribute("loggedUser", loggedUser);
        }
        return "index";
    }
}
