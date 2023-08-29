package cl.Main.Soecsa.Ltda.service;

import cl.Main.Soecsa.Ltda.entity.Student;
import cl.Main.Soecsa.Ltda.entity.UserRol;
import cl.Main.Soecsa.Ltda.repository.IStudentRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    private final IStudentRepository studentsRepository;

    @Autowired
    public StudentService(IStudentRepository studentRepository) {
        this.studentsRepository = studentRepository;
    }

    public List<Student> getStudents() {
        return studentsRepository.findAll();
    }

    public Student getStudentsbyid(Long id) {
        return studentsRepository.findById(id).orElse(null);
    }

    public Student saveStudent(Student student) {
    	student.setUserRol(UserRol.Student);
        return studentsRepository.save(student);
    }

    public void deleteStudent(Long id) {
        studentsRepository.deleteById(id);
    }

}
