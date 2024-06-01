package dao;

import static utils.HibernateUtils.getFactory;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import pojos.Topic;

public class TopicDao {

	public List<String> getAllTopicNames() throws SQLException {
		System.out.println("In getAllTopicNames()");
		
		List<String> topicList = null;
		String jpql = "select t.topicName from Topic t";
		// Get session from the session factory
		Session session = getFactory().getCurrentSession();
		// Begin transaction using session.
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t.topicName from Topic t");
			topicList = session.createQuery(jpql, String.class).getResultList();
			System.out.println(topicList);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return topicList;
	}

	public List<Topic> getAllTopics() throws SQLException {
		List<Topic> topics = null;
		String jpql = "select t from Topic t";
		// Get session from the session factory
		Session session = getFactory().getCurrentSession();
		// Begin transaction using session.
		Transaction tx = session.beginTransaction();
		try {
			topics = session.createQuery(jpql, Topic.class).getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return topics;
	}
	
	public List<Topic> getAllTopicsByName(String topicname) throws SQLException {
		List<Topic> topics = null;
		String jpql = "select t from Topic t where t.topicName=:nm";
		// Get session from the session factory
		Session session = getFactory().getCurrentSession();
		// Begin transaction using session.
		Transaction tx = session.beginTransaction();
		try {
			topics = session.createQuery(jpql, Topic.class).setParameter("nm", topicname)
					.getResultList();

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return topics;
	}

}
