package cl.Main.Soecsa.Ltda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String showHomePage(Model model) {
        // Lógica para mostrar la página de inicio
        return "home"; // Nombre de la vista JSP o HTML
    }
    
    @RequestMapping("/goHome")
    public String showHome(Model model) {
        // Lógica para mostrar la página de inicio
        return "home"; // Nombre de la vista JSP o HTML
    }
    @RequestMapping("/goRegistration")
    public String showRegistration(Model model) {
        // Lógica para mostrar la página de inicio
        return "registration"; // Nombre de la vista JSP o HTML
    }
    
    @RequestMapping("/goGallery")
    public String showGallery(Model model) {
        // Lógica para mostrar la página de inicio
        return "gallery"; // Nombre de la vista JSP o HTML
    }
    @RequestMapping("/goNews")
    public String showNews(Model model) {
        // Lógica para mostrar la página de inicio
        return "news"; // Nombre de la vista JSP o HTML
    }
    @RequestMapping("/goLogin")
    public String showLogin(Model model) {
        // Lógica para mostrar la página de inicio
        return "login"; // Nombre de la vista JSP o HTML
    }
}
