package cl.Main.Soecsa.Ltda.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import cl.Main.Soecsa.Ltda.service.AdminService;

class AdminControllerTest {

    private MockMvc mvc;

    @BeforeEach
    void setUp() {
        AdminService adminService = new AdminService(null, null, null) {
            @Override
            public cl.Main.Soecsa.Ltda.entity.Admin createAdmin(String name, String lastName,
                    String userName, String email, String password) {
                return new cl.Main.Soecsa.Ltda.entity.Admin();
            }
        };
        mvc = MockMvcBuilders.standaloneSetup(new AdminController(adminService)).build();
    }

    @Test
    void administratorFormRouteIsAvailable() throws Exception {
        mvc.perform(get("/admin/crear-admin"))
                .andExpect(status().isOk())
                .andExpect(view().name("create-admin"))
                .andExpect(model().attributeExists("adminForm"));
    }

    @Test
    void administratorCanBeCreatedAndPasswordMustBeConfirmed() throws Exception {
        mvc.perform(post("/admin/crear-admin")
                        .param("name", "Ana")
                        .param("lastName", "Pérez")
                        .param("userName", "ana.admin")
                        .param("email", "ana@example.com")
                        .param("password", "una-clave-segura")
                        .param("confirmPassword", "una-clave-segura"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/admin/crear-admin"));

        mvc.perform(post("/admin/crear-admin")
                        .param("name", "Ana")
                        .param("lastName", "Pérez")
                        .param("userName", "ana.admin")
                        .param("email", "ana@example.com")
                        .param("password", "una-clave-segura")
                        .param("confirmPassword", "otra-clave-segura"))
                .andExpect(status().isOk())
                .andExpect(view().name("create-admin"))
                .andExpect(model().attributeHasFieldErrors("adminForm", "confirmPassword"));
    }
}
