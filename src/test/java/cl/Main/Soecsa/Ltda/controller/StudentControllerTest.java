package cl.Main.Soecsa.Ltda.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.Collections;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import cl.Main.Soecsa.Ltda.entity.Student;
import cl.Main.Soecsa.Ltda.service.StudentService;

class StudentControllerTest {

    private MockMvc mvc;

    @BeforeEach
    void setUp() {
        StudentService studentService = new StudentService(null) {
            @Override
            public java.util.List<Student> getStudents() {
                return Collections.emptyList();
            }

            @Override
            public Student getStudentsbyid(Long id) {
                return new Student();
            }

            @Override
            public Student saveStudent(Student student) {
                return student;
            }

            @Override
            public void deleteStudent(Long id) {
            }
        };
        mvc = MockMvcBuilders.standaloneSetup(new StudentController(studentService)).build();
    }

    @Test
    void studentRoutesResolveToExistingViews() throws Exception {
        mvc.perform(get("/estudiantes"))
                .andExpect(status().isOk())
                .andExpect(view().name("studentsList"))
                .andExpect(model().attributeExists("students"));

        mvc.perform(get("/estudiantes/nuevo"))
                .andExpect(status().isOk())
                .andExpect(view().name("student-formulary"));

        mvc.perform(get("/estudiantes/registro"))
                .andExpect(status().isOk())
                .andExpect(view().name("registration"));

        mvc.perform(get("/estudiantes/1"))
                .andExpect(status().isOk())
                .andExpect(view().name("student-details"));

        mvc.perform(get("/estudiantes/1/editar"))
                .andExpect(status().isOk())
                .andExpect(view().name("edit-student"));
    }

    @Test
    void studentWritesReturnToCanonicalListRoute() throws Exception {
        mvc.perform(post("/estudiantes").param("name", "Ada").param("rut", "12.345.678-5"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/estudiantes"));

        mvc.perform(post("/estudiantes/registro").param("name", "Ada").param("rut", "12.345.678-5"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/goRegistration"));

        mvc.perform(post("/estudiantes/1").param("name", "Ada").param("rut", "12.345.678-5"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/estudiantes"));

        mvc.perform(post("/estudiantes/1/eliminar"))
                .andExpect(status().is3xxRedirection())
                .andExpect(redirectedUrl("/estudiantes"));
    }

    @Test
    void registrationRejectsRutWithInvalidCheckDigit() throws Exception {
        mvc.perform(post("/estudiantes/registro").param("rut", "12.345.678-4"))
                .andExpect(status().isOk())
                .andExpect(view().name("registration"))
                .andExpect(model().attributeHasFieldErrors("student", "rut"));
    }
}
