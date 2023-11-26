package pl.coderslab.charity.controller;

import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.Institution;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.InstitutionRepository;
import pl.coderslab.charity.repository.UserRepository;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private final UserRepository userRepository;
    private final InstitutionRepository institutionRepository;

    private final DonationRepository donationRepository;

    public AdminController(UserRepository userRepository, InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.userRepository = userRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/users")
    public String showAll(Model model, @RequestParam(required = false) Long userToEditId) {
        if (userToEditId != null) {
            User userToEdit = userRepository.getById(userToEditId);
            model.addAttribute("userToEdit", userToEdit);
        }
        List<User> allUsers = userRepository.findAll();
        Multimap<String, User> mapOfUsers = ArrayListMultimap.create();
        allUsers.stream()
                .forEach(user -> mapOfUsers.put(user.getRole(), user));
        List<Institution> institutionList = institutionRepository.findAll();
        model.addAttribute("institutionList", institutionList);
        model.addAttribute("mapOfUsers", mapOfUsers);
        return "admin-panel";
    }

    @PostMapping("/user/update")
    public String edit(User user) {
        userRepository.save(user);
        return "redirect:/admin/users";
    }



    @GetMapping("/user/remove")
    public String remove(@RequestParam Long userId, Principal principal, RedirectAttributes redirectAttributes) {
        User userToRemove = userRepository.getById(userId);
        String loggedUser = principal.getName();
        if (userToRemove.getUsername().equals(loggedUser)) {
            redirectAttributes.addFlashAttribute ("error", "Nie można usunąć samego siebie !!!");
        } else {
            userRepository.delete(userToRemove);
        }

        return "redirect:/admin/users";
    }

    @GetMapping("admin/add")
    public String addAdminForm(Model model) {
        model.addAttribute("admin", new User());
        return "admin-add";
    }

    @PostMapping("admin/add")
    public String addAdmin(User user) {
        userRepository.save(user);
        return "redirect:/admin/users";
    }

    //INSTITUTION

    @GetMapping("/institution/update")
    public String institutionUpdateForm(@RequestParam Long institutionId, Model model) {
        model.addAttribute("institutionToUpdate", institutionRepository.getById(institutionId));
        return "institution-update";
    }

    @PostMapping("/institution/update")
    public String institutionUpdate(Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/admin/users";
    }

    @GetMapping("/institution/remove")
    public String institutionRemove(@RequestParam Long institutionId) {
        Institution institutionToDelete = institutionRepository.getById(institutionId);
        List<Donation> donationsToDelete = donationRepository.findByInstitution(institutionToDelete);

        for (Donation donation : donationsToDelete) {
            donation.setInstitution(null);
        }
        institutionRepository.delete(institutionToDelete);
        return "redirect:/admin/users";
    }

    @GetMapping("institution/add")
    private String InstitutionAddForm(Model model) {
        model.addAttribute("institution", new Institution());
        return "institution-add";
    }

    @PostMapping("institution/add")
    private String InstitutionAddForm(Institution institution) {
        institutionRepository.save(institution);
        return "redirect:/admin/users";
    }
}
