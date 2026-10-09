package cl.Main.Soecsa.Ltda.controladores;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@SpringJUnitWebConfig(locations = { "file:src/main/webapp/WEB-INF/spring/appServlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
class HomeControllerTest {

    private MockMvc mvc;

    @BeforeEach
    void setUp(WebApplicationContext wac) throws Exception {
        mvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    void paginaInicioDeberiaDevolverTextoGenerico() throws Exception {
        mvc
                // Simular una petición GET
                .perform(get("/"))
                // Imprimir resultado en consola
                .andDo(print())
                // Esperar que el estado de la respuesta sea HttpStatus.OK
                .andExpect(status().isOk())
                // Esperar que la vista devuelta "home" como se especificó en el controlador
                .andExpect(view().name("home"));
    }

    @Test
    void rutaAlternativaDeInicioDeberiaDevolverLaPaginaDeInicio() throws Exception {
        mvc
                // Simular una petición GET
                .perform(get("/goHome"))
                // Imprimir resultado en consola
                .andDo(print())
                // Esperar que el estado de la respuesta sea HttpStatus.OK
                .andExpect(status().isOk())
                .andExpect(view().name("home"));
    }

}
