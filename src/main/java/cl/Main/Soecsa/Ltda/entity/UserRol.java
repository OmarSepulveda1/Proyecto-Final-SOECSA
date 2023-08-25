package cl.Main.Soecsa.Ltda.entity;

public enum UserRol {
	Admin, Student;

public static UserRol parse(String text) {
		
		if(Admin.name().equalsIgnoreCase(text)) {
			return Admin;
		}else {
			return Student;
		}
	}
}
