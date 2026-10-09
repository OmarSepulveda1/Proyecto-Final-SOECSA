package cl.Main.Soecsa.Ltda.controladores;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import cl.Main.Soecsa.Ltda.controller.MainController;

class HomeRestControllerTest {

    private MockMvc mvc;

    @BeforeEach
    void setUp() {
        mvc = MockMvcBuilders.standaloneSetup(new MainController()).build();
    }

    @Test
    void rutaDeNoticiasDevuelveSuVista() throws Exception {
        mvc.perform(get("/goNews"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/post/noticias"));
    }

    @Test
    void rutaDeGaleriaDevuelveSuVista() throws Exception {
        mvc.perform(get("/goGallery"))
                .andExpect(status().isOk())
                .andExpect(view().name("gallery"));
    }
}
