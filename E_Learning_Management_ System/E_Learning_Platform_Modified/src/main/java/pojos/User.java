package pojos;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.Table;

@Entity
// Map this to existing tables "users"
@Table(name = "users") // Optional but recommended
public class User extends BaseEntity { // Hibernate DOES NOT mandate that POJO should be Serializable
	/*
	 * name, email, password, role(enum), regAmount, LocalDate/Date regDate
	 */
	
	@Column(length = 30) // VARCHAR(30), unique Constraint
	private String name;
	@Column(length = 30, unique = true) // VARCHAR(30), unique Constraint
	private String email;
	@Column(length = 20, nullable = false) // VARCHAR(30), NOT NULL
	private String password;
	@Column(name = "reg_amt")
	private double regAmount;
	@Column(name = "reg_date")
	private LocalDate regDate; // column: date.
	@Enumerated(EnumType.STRING)
	private UserRole role;

	public User() {
		System.out.println("In user ctor");
	}
	
	public User(String name, String email, String password, double regAmount, LocalDate regDate, UserRole role) {
		super();
		this.name = name;
		this.email = email;
		this.password = password;
		this.regAmount = regAmount;
		this.regDate = regDate;
		this.role = role;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public double getRegAmount() {
		return regAmount;
	}

	public void setRegAmount(double regAmount) {
		this.regAmount = regAmount;
	}

	public LocalDate getRegDate() {
		return regDate;
	}

	public void setRegDate(LocalDate regDate) {
		this.regDate = regDate;
	}

	public UserRole getRole() {
		return role;
	}

	public void setRole(UserRole role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [name=" + name + ", email=" + email + ", password=" + password + ", regAmount=" + regAmount
				+ ", regDate=" + regDate + ", role=" + role + "]";
	}

}
