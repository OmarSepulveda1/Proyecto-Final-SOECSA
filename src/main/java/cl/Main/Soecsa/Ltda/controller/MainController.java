package cl.Main.Soecsa.Ltda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.ui.Model;

import cl.Main.Soecsa.Ltda.entity.Student;

@Controller
public class MainController {

    @GetMapping({ "/", "/goHome" })
    public String showHomePage() {
        return "home";
    }

    @GetMapping("/goRegistration")
    public String showRegistration(Model model) {
        model.addAttribute("student", new Student());
        return "registration";
    }

    @GetMapping("/goGallery")
    public String showGallery() {
        return "gallery";
    }

    @GetMapping("/goNews")
    public String showNews() {
        return "redirect:/post/noticias";
    }

    @GetMapping("/goLogin")
    public String showLogin() {
        return "login";
    }
}
