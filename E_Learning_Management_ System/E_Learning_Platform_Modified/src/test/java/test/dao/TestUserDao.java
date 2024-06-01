package test.dao;

import java.time.LocalDate;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import dao.UserDao;
import pojos.User;
import pojos.UserRole;

class TestUserDao {

	UserDao userDao;
	@BeforeEach
	void setUp() throws Exception {
		userDao = new UserDao();
	}

	@Test
	void testUserRegistration() {
		LocalDate date= LocalDate.parse("2024-04-24");
		userDao.userRegistration(new User("ramraj", "ramraj@gmail.com","002404", 550.00, date, UserRole.valueOf("CUSTOMER")));
	}

}
