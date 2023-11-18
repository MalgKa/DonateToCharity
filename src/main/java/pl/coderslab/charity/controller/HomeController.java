package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }


    @RequestMapping("/")
    public String homeAction(Model model){
        List<Institution> institutionList = institutionRepository.findAll();
        Integer numberOfBags = donationRepository.numberOfDonatedBags();
        Integer numberOfDonations = donationRepository.numberOfDonations();
        model.addAttribute("numberOfDonations", numberOfDonations);
        model.addAttribute("institutionList", institutionList);
        model.addAttribute("numberOfBags", numberOfBags);
        return "index";
    }
}
