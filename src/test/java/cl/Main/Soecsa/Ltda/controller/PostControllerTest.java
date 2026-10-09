package cl.Main.Soecsa.Ltda.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.concurrent.atomic.AtomicReference;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import cl.Main.Soecsa.Ltda.service.PostService;

class PostControllerTest {

    private MockMvc mvc;
    private AtomicReference<cl.Main.Soecsa.Ltda.entity.Post> createdPost;

    @BeforeEach
    void setUp() {
        createdPost = new AtomicReference<>();
        PostService postService = new PostService(null) {
            @Override
            public java.util.List<cl.Main.Soecsa.Ltda.entity.Post> getPost() {
                return new ArrayList<>();
            }

            @Override
            public cl.Main.Soecsa.Ltda.entity.Post getPost(Long id) {
                return new cl.Main.Soecsa.Ltda.entity.Post();
            }

            @Override
            public cl.Main.Soecsa.Ltda.entity.Post createPost(cl.Main.Soecsa.Ltda.entity.Post post) {
                createdPost.set(post);
                return post;
            }

            @Override
            public void deletePost(Long id) {
            }
        };
        mvc = MockMvcBuilders.standaloneSetup(new PostController(postService)).build();
    }

    @Test
    void noticiasRouteUsesExistingViewAndProvidesPosts() throws Exception {
        mvc.perform(get("/post/noticias"))
                .andExpect(status().isOk())
                .andExpect(view().name("news"))
                .andExpect(model().attributeExists("posts"));

        mvc.perform(get("/post/noticia/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("post-details"));

        mvc.perform(get("/post/nuevo"))
                .andExpect(status().isOk())
                .andExpect(view().name("post-form"))
                .andExpect(model().attributeExists("formAction"));

        mvc.perform(get("/post/1/editar"))
                .andExpect(status().isOk())
                .andExpect(view().name("post-form"));

        mvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post("/post"))
                .andExpect(status().is3xxRedirection())
                .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl("/post/noticias"));

        mvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post("/post/1"))
                .andExpect(status().is3xxRedirection())
                .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl("/post/noticias"));

        mvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post("/post/1/eliminar"))
                .andExpect(status().is3xxRedirection())
                .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl("/post/noticias"));
    }

    @Test
    void createPostBindsIsoPublicationDateFromForm() throws Exception {
        mvc.perform(org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post("/post")
                        .param("title", "Noticia de prueba")
                        .param("publicationDate", "2026-10-09")
                        .param("text", "Contenido de prueba"))
                .andExpect(status().is3xxRedirection())
                .andExpect(org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl("/post/noticias"));

        org.junit.jupiter.api.Assertions.assertEquals(LocalDate.of(2026, 10, 9),
                createdPost.get().getPublicationDate());
    }
}
