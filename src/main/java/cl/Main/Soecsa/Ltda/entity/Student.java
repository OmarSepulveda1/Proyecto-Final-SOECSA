package cl.Main.Soecsa.Ltda.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "student")
@PrimaryKeyJoinColumn(columnDefinition = "id")
public class Student extends User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "name")
    private String name;
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "rut")
    private int rut;
    @Column(name = "age")
    private int age;
    @Column(name = "last_grade_studied")
    private String lastGradeStudied;
    @Column(name = "phone_number")
    private String phoneNumber;
    
    public Student() {
    	super();
    }
    
	
	public Student(Long id, String userName, String password, UserRol userRol, String email) {
		super(id, userName, password, userRol, email);
		// TODO Auto-generated constructor stub
	}

	public Student(Long id, String userName, String name, String lastName, int rut, int age, String lastGradeStudied, String phoneNumber) {
		super(id, userName, UserRol.Student);
		this.name = name;
		this.lastName = lastName;
		this.rut = rut;
		this.lastGradeStudied = lastGradeStudied;
		this.phoneNumber = phoneNumber;
	}

	public Student(Long id, String userName, String password, String name, String lastName, int rut, int age, String lastGradeStudied, String phoneNumber) {
		super(id, userName, UserRol.Student);
		this.name = name;
		this.lastName = lastName;
		this.rut = rut;
		this.lastGradeStudied = lastGradeStudied;
		this.phoneNumber = phoneNumber;
	}

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	
	/**
	 * @return the rut
	 */
	public int getRut() {
		return rut;
	}

	/**
	 * @param rut the rut to set
	 */
	public void setRut(int rut) {
		this.rut = rut;
	}

	/**
	 * @return the age
	 */
	public int getAge() {
		return age;
	}

	/**
	 * @param age the age to set
	 */
	public void setAge(int age) {
		this.age = age;
	}

	/**
	 * @return the lastGradeStudied
	 */
	public String getLastGradeStudied() {
		return lastGradeStudied;
	}

	/**
	 * @param lastGradeStudied the lastGradeStudied to set
	 */
	public void setLastGradeStudied(String lastGradeStudied) {
		this.lastGradeStudied = lastGradeStudied;
	}

	/**
	 * @return the phoneNumber
	 */
	public String getPhoneNumber() {
		return phoneNumber;
	}

	/**
	 * @param phoneNumber the phoneNumber to set
	 */
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
}
