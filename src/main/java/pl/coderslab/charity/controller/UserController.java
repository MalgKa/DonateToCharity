package pl.coderslab.charity.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.charity.entity.User;
import pl.coderslab.charity.repository.UserRepository;
import pl.coderslab.charity.service.EmailSenderService;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final EmailSenderService emailSenderService;

    public UserController(UserRepository userRepository, PasswordEncoder passwordEncoder, EmailSenderService emailSenderService) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.emailSenderService = emailSenderService;
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
}
