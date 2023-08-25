package cl.Main.Soecsa.Ltda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String showHomePage(Model model) {
        // Lógica para mostrar la página de inicio
        return "home"; // Nombre de la vista JSP o HTML
    }

    // Otras rutas y métodos principales de la aplicación
}
