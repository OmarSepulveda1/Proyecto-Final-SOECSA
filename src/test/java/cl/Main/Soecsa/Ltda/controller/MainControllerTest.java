package cl.Main.Soecsa.Ltda.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.LinkedHashMap;
import java.util.Map;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class MainControllerTest {

    private MockMvc mvc;

    @BeforeEach
    void setUp() {
        mvc = MockMvcBuilders.standaloneSetup(new MainController()).build();
    }

    @Test
    void pageRoutesResolveToTheirViews() throws Exception {
        Map<String, String> routes = new LinkedHashMap<>();
        routes.put("/", "home");
        routes.put("/goHome", "home");
        routes.put("/goRegistration", "registration");
        routes.put("/goGallery", "gallery");
        routes.put("/goLogin", "login");

        for (Map.Entry<String, String> route : routes.entrySet()) {
            mvc.perform(get(route.getKey()))
                    .andExpect(status().isOk())
                    .andExpect(view().name(route.getValue()));
        }

        mvc.perform(get("/goNews"))
                .andExpect(status().is3xxRedirection())
                .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers
                        .redirectedUrl("/post/noticias"));
    }
}
