package cl.Main.Soecsa.Ltda.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cl.Main.Soecsa.Ltda.entity.Student;
import cl.Main.Soecsa.Ltda.service.StudentService;
import cl.Main.Soecsa.Ltda.validation.ChileanRut;

@Controller
@RequestMapping("/estudiantes")
public class StudentController {

    private final StudentService studentService;

    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @GetMapping
    public String listStudents(Model model) {
        List<Student> students = studentService.getStudents();
        model.addAttribute("students", students);
        return "studentsList";
    }

    @GetMapping("/nuevo")
    public String showCreateForm(Model model) {
        model.addAttribute("student", new Student());
        return "student-formulary";
    }

    @GetMapping("/registro")
    public String showRegistrationForm(Model model) {
        model.addAttribute("student", new Student());
        return "registration";
    }

    @PostMapping("/registro")
    public String registerStudent(Student student, BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        if (!normalizeRut(student, bindingResult)) {
            return "registration";
        }
        student.setUserName(null);
        student.setPassword(null);
        studentService.saveStudent(student);
        redirectAttributes.addFlashAttribute("mensaje", "Tu solicitud de registro fue recibida.");
        return "redirect:/goRegistration";
    }

    @PostMapping
    public String createStudent(Student student, BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        if (!normalizeRut(student, bindingResult)) {
            return "student-formulary";
        }
        studentService.saveStudent(student);
        redirectAttributes.addFlashAttribute("mensaje", "El estudiante se creó correctamente.");
        return "redirect:/estudiantes";
    }

    @GetMapping("/{id}")
    public String showStudent(@PathVariable Long id, Model model) {
        model.addAttribute("student", findStudent(id));
        return "student-details";
    }

    @GetMapping("/{id}/editar")
    public String showEditForm(@PathVariable Long id, Model model) {
        model.addAttribute("student", findStudent(id));
        return "edit-student";
    }

    @PostMapping("/{id}")
    public String updateStudent(@PathVariable Long id, Student student, BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        Student existingStudent = findStudent(id);
        if (!normalizeRut(student, bindingResult)) {
            student.setId(existingStudent.getId());
            return "edit-student";
        }
        student.setId(existingStudent.getId());
        student.setUserName(existingStudent.getUserName());
        student.setPassword(existingStudent.getPassword());
        studentService.saveStudent(student);
        redirectAttributes.addFlashAttribute("mensaje", "El estudiante se actualizó correctamente.");
        return "redirect:/estudiantes";
    }

    @PostMapping("/{id}/eliminar")
    public String deleteStudent(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        findStudent(id);
        studentService.deleteStudent(id);
        redirectAttributes.addFlashAttribute("mensaje", "El estudiante se eliminó correctamente.");
        return "redirect:/estudiantes";
    }

    private Student findStudent(Long id) {
        Student student = studentService.getStudentsbyid(id);
        if (student == null) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, "No existe el estudiante solicitado.");
        }
        return student;
    }

    private boolean normalizeRut(Student student, BindingResult bindingResult) {
        String normalizedRut = ChileanRut.normalize(student.getRut());
        if (normalizedRut == null) {
            bindingResult.rejectValue("rut", "student.rut.invalid",
                    "Ingresa un RUT válido, por ejemplo 12.345.678-5.");
            return false;
        }
        student.setRut(normalizedRut);
        return true;
    }
}
