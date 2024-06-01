package test.dao;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import dao.TutorialDao;
import pojos.Tutorial;

class TestTutorialDaoImpl {

	private TutorialDao tutDao;

	@BeforeEach
	void setUp() throws Exception {
		tutDao = new TutorialDao();
	}

	@Test
	void testGetAllTutorialByTopic() throws Exception {

		List<String> list = tutDao.getAllTutorialByTopic("Spring Framework");
		System.out.println(list);
	}

	@Test
	void testGetAllTutorialDetails() throws Exception {

		Tutorial tutorial = tutDao.getAllTutorialDetails("Spring Boot");
		System.out.println(tutorial);
	}
	@Test
	void testUpdateVisits() throws Exception {
		
		String status = tutDao.updateVisits(1);
		System.out.println(status);
	}

}
