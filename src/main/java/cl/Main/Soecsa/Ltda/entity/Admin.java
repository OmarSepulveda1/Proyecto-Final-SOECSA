package cl.Main.Soecsa.Ltda.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
@PrimaryKeyJoinColumn(columnDefinition = "id")
public class Admin extends User{
	
	@Column(name = "name")
	private String name;
	@Column(name = "last_name")
	private String lastName;
	
	public Admin() {
		super();
	}

	public Admin(Long id, String userName, String password, UserRol userRol) {
		super(id, userName, password, userRol);
		// TODO Auto-generated constructor stub
	}

	public Admin(Long id, String userName, String name, String lastName) {
		super(id, userName);
		this.name= name;
		this.lastName= lastName;
		
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

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

		
	
	
	

}
