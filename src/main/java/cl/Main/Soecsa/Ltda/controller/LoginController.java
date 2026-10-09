package cl.Main.Soecsa.Ltda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

    @GetMapping("/login")
    public ModelAndView showLogin() {
        return new ModelAndView("login");
    }

    @GetMapping("/error")
    public ModelAndView showLoginError() {
        return new ModelAndView("login", "error", true);
    }
}
