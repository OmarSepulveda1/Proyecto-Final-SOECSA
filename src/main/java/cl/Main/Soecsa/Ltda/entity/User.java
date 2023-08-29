package cl.Main.Soecsa.Ltda.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;

@Entity
@Table(name="users")
@Inheritance(strategy = InheritanceType.JOINED)
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private Long id;
	@Column(name = "user_name")
	private String userName;
	@Column(name = "password")
	private String password;
	@Column(name = "email")
    private String email;
	@Column(name = "user_rol")
	@Enumerated(EnumType.STRING)
	private UserRol userRol;
	
	public User( ) {}
	
	public User(Long id) {
		super();
		this.id = id;
		
	}

	public User(Long id, String userName) {
		super();
		this.id = id;
		this.userName = userName;
	}

	public User(Long id, String userName, UserRol userRol) {
		super();
		this.id = id;
		this.userName = userName;
		this.userRol = userRol;
	}

	public User(Long id, String userName, String password, UserRol userRol, String email) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.userRol = userRol;
		this.email = email;
		
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the userRol
	 */
	public UserRol getUserRol() {
		return userRol;
	}

	/**
	 * @param userRol the userRol to set
	 */
	public void setUserRol(UserRol userRol) {
		this.userRol = userRol;
	}

	@Override
	public String toString() {
		return super.toString();
	}
	
}
