package pl.coderslab.charity.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailSenderService {


    @Autowired
    private JavaMailSender javamailSender;

    public void sendActivationEmail(String toEmail,String activationLink){

        SimpleMailMessage message = new SimpleMailMessage();

        message.setFrom("kasprzak.projects@gmail.com");
        message.setTo(toEmail);
        message.setSubject("Aktywacja konta");
        message.setText("Witaj!\n\nAby aktywować swoje konto, kliknij poniższy link:\n" + activationLink);
        javamailSender.send(message);
    }
}
