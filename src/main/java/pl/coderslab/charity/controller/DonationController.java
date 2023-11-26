package pl.coderslab.charity.controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.util.List;
import java.util.Set;

@Controller
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;
    private final UserRepository userRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository, UserRepository userRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
        this.userRepository = userRepository;
    }
    @GetMapping("/form")
    public String form(@AuthenticationPrincipal UserDetails authenticatedUser, Model model) {
        List<Category> categories = categoryRepository.findAll();
        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("donation", new Donation());
        model.addAttribute("institutions", institutions);
        model.addAttribute("categories", categories);

        if (authenticatedUser != null) {
            User loggedUser = userRepository.getByUsername(authenticatedUser.getUsername());
            model.addAttribute("loggedUser", loggedUser);
        }
        return "form";
    }
    @PostMapping("/form")
    public String confirmForm(@AuthenticationPrincipal UserDetails authenticatedUser, Donation donation, Model model) {
        donationRepository.save(donation);
        if (authenticatedUser != null) {
            User user = userRepository.getWithDonationsByUsername(authenticatedUser.getUsername());
            user.getUserDonations().add(donation);
            userRepository.save(user);
            model.addAttribute("loggedUser", userRepository.getByUsername(authenticatedUser.getUsername()));
        }
        return "form-confirmation";
    }
    @GetMapping("/donations")
    public String donationList(@AuthenticationPrincipal UserDetails authenticatedUser, Model model){
        User user = userRepository.getByUsername(authenticatedUser.getUsername());
//        Set<Donation> donationList = user.getUserDonations();
        List<Donation>donationList=donationRepository.findAllByUserIdOrderByPickupDate(user.getId());
        model.addAttribute("donationList", donationList);
        model.addAttribute("loggedUser", user);
        return "donation-list";
    }
}
