package beans;

import java.time.LocalDate;

import dao.UserDao;
import pojos.User;
import pojos.UserRole;

public class UserBean {
	// Properties: state (non static and non transient)
	// Client's conversational state (client specific info).
	// VIMP: These property names have to be same as form names.
	// i.e. : Name of the request parameter must match with the Java Bean property.
	private String email;
	private String password;

	private String name;
	private double regAmount;
	private String regDate;

	// Bean will be managing DAO layer.
	// DAO layer ref.
	private UserDao userDao;

	// Validated user details.
	private User validatedUserDetails;

	// Status message
	private String message;

	// default arg-less ctor
	public UserBean() { // if private: BeanInstantiationException.
		super();
		System.out.println("In ctor of " + getClass().getName());
		// Create instance of DAO layer.
		userDao = new UserDao();
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

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public User getValidatedUserDetails() {
		return validatedUserDetails;
	}

	public String getMessage() {
		return message;
	}

	// Add B.L. method: For user validation.
	public String authenticateUser() {
		System.out.println("in B.L.: authenticateUser()  " + email + "  " + password);

		// invoke DAO's method for validation.
		try {
			validatedUserDetails = userDao.validateUser(email, password);
		} catch (RuntimeException e) {
			System.out.println("error in bean " + e.getMessage());// NoResultException.
			message = "Invalid login, Please retry...";
			return "login";
		}
		// Valid login
		// role based checking
		if (validatedUserDetails.getRole().equals(UserRole.CUSTOMER)) {// Customer login
			message = "Customer Login successful...";
			return "TopicServlet";
		}
		// Admin login
		message = "Admin Login successful...";
		return "admin_operation";
	}

	
	public String registerUser() {
		System.out.println("in B.L.: registerUser()");
		int newId;
		// invoke DAO's method for validation.
		try {
			LocalDate registrationDate = LocalDate.parse(regDate);
			newId = userDao.userRegistration(
					new User(name, email, password, regAmount, registrationDate, UserRole.valueOf("CUSTOMER")));
			message= "User: "+name+" is registered successfully with id: "+newId;
		} catch (RuntimeException e) {
			System.out.println("error in bean " + e.getMessage());// NoResultException.
			message = "Invalid Details, Please retry...";
			return "RegisterServlet";// If registration fails, user will again see the blank registration form.
		}

		return "login.jsp";// After successful registration, user will be redirected to login page.
	}

	public double getRegAmount() {
		return regAmount;
	}

	public void setRegAmount(double regAmount) {
		this.regAmount = regAmount;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getRegDate() {
		return regDate;
	}

}
