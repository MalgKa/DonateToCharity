package pl.coderslab.charity.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.charity.entity.Donation;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.DonationRepository;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.EmailSenderService;

import javax.servlet.http.HttpServletRequest;
import java.util.Set;

@Controller
public class UserController {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailSenderService emailSenderService;
    private final DonationRepository donationRepository;

    public UserController(UserRepository userRepository, PasswordEncoder passwordEncoder, EmailSenderService emailSenderService, DonationRepository donationRepository) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailSenderService = emailSenderService;
        this.donationRepository = donationRepository;
    }
    @GetMapping("/register")
    public String registerForm(Model model) {
        model.addAttribute("user", new User());
        return "register";
    }
    @PostMapping("/register")
    public String register(User user, HttpServletRequest request) {
        user.setActive(false);
        user.setRole("ROLE_USER");
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(user);
        String activationLink = getAppUrl(request) + "/activate?username=" + user.getUsername();
        emailSenderService.sendActivationEmail(user.getUsername(), activationLink);
        return "redirect:/login";
    }
    @GetMapping("/activate")
    public String activateAccount(@RequestParam String username) {
        User user = userRepository.getByUsername(username);
        if (user != null) {
            user.setActive(true);
            userRepository.save(user);
            return "accountActivated";
        } else {
            return "errorAccount";
        }
    }
    private String getAppUrl(HttpServletRequest request) {
        return "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
    @GetMapping("/update/profile")
    public String profileView(@AuthenticationPrincipal UserDetails authenticatedUser , @RequestParam(required = false) Long userToEditId, Model model){
        if (userToEditId != null) {
            User userToEdit = userRepository.getById(userToEditId);
            model.addAttribute("userToEdit", userToEdit);
        }
        User loggedUser =userRepository.getByUsername(authenticatedUser.getUsername());
        model.addAttribute("loggedUser", loggedUser);

        return "profile";
    }
    @PostMapping("/update/profile")
    public String profileChange(User user ) {
        Set<Donation> donationList=donationRepository.findAllByUserIdOrderByPickupDate(user.getId());
        user.setUserDonations(donationList);
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!user.getUsername().equals(authentication.getName())){
            userRepository.save(user);
            SecurityContextHolder.getContext().setAuthentication(null);
            return "redirect:/login";
        }
        userRepository.save(user);
        return "redirect:/update/profile";
    }
    @GetMapping("/update/password")
    public String updatePasswordView(@AuthenticationPrincipal UserDetails authenticatedUser, Model model){
        User loggedUser =userRepository.getByUsername(authenticatedUser.getUsername());
        model.addAttribute("loggedUser", loggedUser);
        return "change-password";
    }
    @PostMapping("/update/password")
    public String changePassword(User user,@RequestParam String newPassword, RedirectAttributes redirectAttributes){
        if(newPassword.isEmpty()){
            redirectAttributes.addFlashAttribute ("error", "Nie wpisałeś hasła");
            return "redirect:/update/password";
        }
        user.setPassword(passwordEncoder.encode(newPassword));
        Set<Donation> donationList=donationRepository.findAllByUserIdOrderByPickupDate(user.getId());
        user.setUserDonations(donationList);
        userRepository.save(user);
        return "redirect:/update/profile";
    }
}
