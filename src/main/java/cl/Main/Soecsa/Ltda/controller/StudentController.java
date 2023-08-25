package cl.Main.Soecsa.Ltda.controller;

import cl.Main.Soecsa.Ltda.entity.Student;
import cl.Main.Soecsa.Ltda.service.StudentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/estudiantes")
public class StudentController {

    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping("/lista")
    public String mostrarListaStudents(Model model) {
        List<Student> students = studentService.getStudents();
        model.addAttribute("students", students);
        return "students/lista"; // Nombre del archivo JSP para la lista de estudiantes
    }

    @GetMapping("/detalles/{id}")
    public String mostrarDetallesStudent(@PathVariable Long id, Model model) {
        Student student = studentService.getStudentsbyid(id);
        model.addAttribute("student", student);
        return "students/detalles"; // Nombre del archivo JSP para los detalles del estudiante
    }

    @GetMapping("/crear")
    public String mostrarFormularioCrearStudent(Model model) {
        model.addAttribute("student", new Student());
        return "students/formulario-crear"; // Nombre del archivo JSP para el formulario de creación
    }

    @PostMapping("/guardar")
    public String guardarStudent(Student student) {
        studentService.saveStudent(student);
        return "redirect:/students/lista"; // Redireccionar a la lista después de guardar
    }
    @PreAuthorize("hasRole('ADMIN')")
    @PostMapping("/borrar/{id}")
    public String borrarStudent(@PathVariable Long id) {
        

        studentService.deleteStudent(id);

        return "redirect:/estudiantes/lista"; // Redireccionar a la lista después de borrar
    }
    
}



