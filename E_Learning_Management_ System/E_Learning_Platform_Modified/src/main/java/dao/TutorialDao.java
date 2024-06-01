package dao;

import static utils.HibernateUtils.getFactory;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import pojos.Tutorial;

public class TutorialDao {

	public List<String> getAllTutorialByTopic(String name) throws SQLException {
		System.out.println("In getAllTutorialByTopic()");
		List<String> tutNames = null;
		String jpql = "select t.tutorialName from Tutorial t where t.currentTopic.topicName=:tName";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t.tutorialName from Tutorial t where t.currentTopic.topicName=:tName");
			tutNames = session.createQuery(jpql, String.class).setParameter("tName", name).getResultList(); // PERSISTENT.

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return tutNames;
	}
	public List<Tutorial> getAllTutorials() throws SQLException {
		System.out.println("In getAllTutorialByTopic()");
		List<Tutorial> tutNames = null;
		String jpql = "select t from Tutorial t";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t from Tutorial t");
			tutNames = session.createQuery(jpql, Tutorial.class).getResultList(); // PERSISTENT.
			
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return tutNames;
	}

	public Tutorial getAllTutorialDetails(String tutName) throws SQLException {
		System.out.println("In getAllTutorialByTopic()");
		Tutorial tutorial = null;
		String jpql = "select t from Tutorial t where t.tutorialName=:tName";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t from Tutorial t where t.tutorialName=:tName");
			tutorial = session.createQuery(jpql, Tutorial.class).setParameter("tName", tutName).getSingleResult(); // PERSISTENT.

			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return tutorial;
	}

	public String updateVisits(int topicId) throws SQLException {
		System.out.println("In updateVisits()");
		Tutorial tutorial = null;
		String msg = "Update count failed, please check the input again..";
		String jpql = "select t from Tutorial t where t.id=:tId";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t from Tutorial t where t.id=:tId");
			tutorial = session.createQuery(jpql, Tutorial.class).setParameter("iId", topicId).getSingleResult(); // PERSISTENT.

			tutorial.setVisits(tutorial.getVisits() + 1);
			msg = "Visit count updated, current visits: " + tutorial.getVisits();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return msg;
	}

	public List<Tutorial> getAllTutorialByTopic(int topicId) throws SQLException {
		List<Tutorial> tutorials = null;
		
		String jpql = "SELECT t FROM Tutorial t WHERE t.currentTopic.id = :topicId";
		Session session = getFactory().getCurrentSession();
		Transaction tx = session.beginTransaction();
		try {
			tutorials = session.createQuery(jpql, Tutorial.class).
					setParameter("topicId", topicId).
					getResultList();
//			updateVisits(topicId);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return tutorials;
	}

	public int getVisitCount(String tutName) throws SQLException {
		System.out.println("In getVisitCount()");
		Tutorial tutorial = null;
		String jpql = "select t from Tutorial t where t.tutorialName=:tName";
		int visits = 0;
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			System.out.println("select t from Tutorial t where t.tutorialName=:tName");
			tutorial = session.createQuery(jpql, Tutorial.class).setParameter("tName", tutName).getSingleResult(); // PERSISTENT.
			visits = tutorial.getVisits();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return visits;
	}

	public String addNewTutorial(Tutorial tutorial) throws SQLException {
		System.out.println("In updateVisits()");
		String msg = "Tutorial adding failed..!";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			session.persist(tutorial);
			msg = "New Tutorial added successfully with Title: " + tutorial.getTutorialName();
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return msg;
	}
	
	public String deleteTutorial(int id) throws SQLException {
		System.out.println("In updateVisits()");
		String msg = "Tutorial deletion failed..!";
		String jpql="select t from Tutorial t where t.id=:tid";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			
			Tutorial tutorial = session.createQuery(jpql, Tutorial.class).setParameter("tid", id).getSingleResult();
			msg = "Tutorial deleted successfully with Title: " + tutorial.getTutorialName();
			session.delete(tutorial);
			tx.commit();
		} catch (RuntimeException e) {
			if (tx != null)
				tx.rollback();
			throw e;
		}
		return msg;
	}

}
