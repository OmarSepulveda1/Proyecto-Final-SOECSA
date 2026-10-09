package cl.Main.Soecsa.Ltda.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.Main.Soecsa.Ltda.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping("/crear-admin")
    public String showCreateForm(Model model) {
        if (!model.containsAttribute("adminForm")) {
            model.addAttribute("adminForm", new AdminCreationForm());
        }
        return "create-admin";
    }

    @PostMapping("/crear-admin")
    public String createAdmin(@ModelAttribute("adminForm") AdminCreationForm form,
            BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        validate(form, bindingResult);
        if (bindingResult.hasErrors()) {
            return "create-admin";
        }

        try {
            adminService.createAdmin(form.getName(), form.getLastName(), form.getUserName(),
                    form.getEmail(), form.getPassword());
        } catch (IllegalArgumentException exception) {
            bindingResult.addError(new FieldError("adminForm", "userName", exception.getMessage()));
            form.setPassword(null);
            form.setConfirmPassword(null);
            return "create-admin";
        }
        redirectAttributes.addFlashAttribute("mensaje", "El administrador se creó correctamente.");
        return "redirect:/admin/crear-admin";
    }

    private void validate(AdminCreationForm form, BindingResult errors) {
        requireText(form.getName(), "name", "Ingresa el nombre.", errors);
        requireText(form.getLastName(), "lastName", "Ingresa el apellido.", errors);
        requireText(form.getUserName(), "userName", "Ingresa el nombre de usuario.", errors);
        requireText(form.getEmail(), "email", "Ingresa el correo electrónico.", errors);

        if (hasText(form.getName()) && form.getName().trim().length() > 255) {
            errors.rejectValue("name", "admin.name.length", "El nombre no puede superar 255 caracteres.");
        }
        if (hasText(form.getLastName()) && form.getLastName().trim().length() > 255) {
            errors.rejectValue("lastName", "admin.lastName.length", "El apellido no puede superar 255 caracteres.");
        }
        if (hasText(form.getUserName())
                && (form.getUserName().trim().length() < 3 || form.getUserName().trim().length() > 50)) {
            errors.rejectValue("userName", "admin.userName.length",
                    "El usuario debe tener entre 3 y 50 caracteres.");
        }
        if (hasText(form.getEmail())
                && (!form.getEmail().trim().matches("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$")
                        || form.getEmail().trim().length() > 100)) {
            errors.rejectValue("email", "admin.email.invalid",
                    "Ingresa un correo válido de hasta 100 caracteres.");
        }
        if (form.getPassword() == null || form.getPassword().length() < 12) {
            errors.rejectValue("password", "admin.password.length",
                    "La contraseña debe tener al menos 12 caracteres.");
        }
        if (form.getPassword() != null && !form.getPassword().equals(form.getConfirmPassword())) {
            errors.rejectValue("confirmPassword", "admin.password.mismatch",
                    "Las contraseñas no coinciden.");
        }
    }

    private void requireText(String value, String field, String message, BindingResult errors) {
        if (!hasText(value)) {
            errors.rejectValue(field, "admin.required", message);
        }
    }

    private boolean hasText(String value) {
        return value != null && !value.trim().isEmpty();
    }

    public static class AdminCreationForm {
        private String name;
        private String lastName;
        private String userName;
        private String email;
        private String password;
        private String confirmPassword;

        public String getName() { return name; }
        public void setName(String name) { this.name = name; }
        public String getLastName() { return lastName; }
        public void setLastName(String lastName) { this.lastName = lastName; }
        public String getUserName() { return userName; }
        public void setUserName(String userName) { this.userName = userName; }
        public String getEmail() { return email; }
        public void setEmail(String email) { this.email = email; }
        public String getPassword() { return password; }
        public void setPassword(String password) { this.password = password; }
        public String getConfirmPassword() { return confirmPassword; }
        public void setConfirmPassword(String confirmPassword) { this.confirmPassword = confirmPassword; }
    }
}
