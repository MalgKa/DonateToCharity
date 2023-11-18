package pl.coderslab.charity.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.entity.Category;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.repository.CategoryRepository;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;

import java.util.List;
@Controller
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;

    private final DonationRepository donationRepository;

    public DonationController(CategoryRepository categoryRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/form")
    public String form(Model model){
        List<Category> categories = categoryRepository.findAll();
        List<Institution> institutions = institutionRepository.findAll();
        model.addAttribute("donation", new Donation());
        model.addAttribute("institutions", institutions);
        model.addAttribute("categories", categories);
        return "form";
    }

    @PostMapping("/form")
    public String confirmForm(Donation donation){
        donationRepository.save(donation);
        return "form-confirmation";
    }


}
