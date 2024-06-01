package dao;

import pojos.User;
import static utils.HibernateUtils.getFactory;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {
	// No data members, No ctor, no cleanup.

	public User validateUser(String email, String password) {
		User user=null;
		String jpql="select u from User u where u.email=:email and u.password=:pass";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			user=session.createQuery(jpql, User.class).
					setParameter("email", email).
					setParameter("pass", password).
					getSingleResult(); // PERSISTENT.
			
			tx.commit();
		} catch (RuntimeException e) {
			if(tx != null)
				tx.rollback();
			throw e;
		}
		return user;// user: DETACHED.
		// DAO is returning DETACHED POJO to bean.
	}

	public int userRegistration(User user) {
		int id;
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			id = (int) session.save(user); 
			
			tx.commit();
		} catch (RuntimeException e) {
			if(tx != null)
				tx.rollback();
			throw e;
		}
		return id;
	}

	public String deleteUser(int id) {
		String msg="User deletion fialed.";
		String jpql="select u from User u where u.id=:Id";
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			User user = session.createQuery(jpql, User.class).setParameter("Id", id).getSingleResult();
			session.delete(user);
			msg="User: "+user.getName()+" deleted Successfully!!";
			tx.commit();
		} catch (RuntimeException e) {
			if(tx != null)
				tx.rollback();
			throw e;
		}
		return msg;
	}
	
	public List<User> getAllUsers() {
		String jpql="select u from User u";
		List<User> users= null;
		// Get session from session factory
		Session session = getFactory().getCurrentSession();
		// Begin a transaction
		Transaction tx = session.beginTransaction();
		try {
			users = session.createQuery(jpql, User.class).getResultList();
			tx.commit();
		} catch (RuntimeException e) {
			if(tx != null)
				tx.rollback();
			throw e;
		}
		return users;
	}
}
