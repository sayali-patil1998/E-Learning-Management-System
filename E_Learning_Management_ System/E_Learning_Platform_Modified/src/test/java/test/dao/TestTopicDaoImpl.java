package test.dao;

import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import dao.TopicDao;
import pojos.Topic;

class TestTopicDaoImpl {

	private TopicDao topicDao;

	@BeforeEach
	void setUp() throws Exception {
		topicDao = new TopicDao();
	}

	@Test
	void testGetAllTopics() throws Exception {
		List<Topic> topicNames = topicDao.getAllTopics();
		topicNames.forEach(t -> System.out.println(t));

	}

	@Test
	void getAllTopicNames() throws Exception {
		List<String> topicNames = topicDao.getAllTopicNames();
		topicNames.forEach(t -> System.out.println(t));

	}

}
