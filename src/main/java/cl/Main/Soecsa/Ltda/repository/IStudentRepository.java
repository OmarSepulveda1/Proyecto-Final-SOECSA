package cl.Main.Soecsa.Ltda.repository;


	import org.springframework.data.jpa.repository.JpaRepository;

import cl.Main.Soecsa.Ltda.entity.Student;

	public interface IStudentRepository extends JpaRepository<Student, Long> {
	   
	}

