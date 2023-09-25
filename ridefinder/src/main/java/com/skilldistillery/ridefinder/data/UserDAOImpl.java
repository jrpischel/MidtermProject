package com.skilldistillery.ridefinder.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Address;
import com.skilldistillery.ridefinder.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(User user) {

		User authUser = null;

		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";

		try {
			authUser = em.createQuery(jpql, User.class).setParameter("un", user.getUsername())
					.setParameter("pw", user.getPassword()).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid User" + e);
		}

		return authUser;
	}

	@Override
	public User getUserByUserNameAndPassword(String userName, String password) {
		User user = null;

		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", userName).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid User" + e);
		}
		return user;
	}

	@Override
	public User createUserAccount(String userName, String password) {

		User user = new User();
		user.setUsername(userName);
		user.setPassword(password);
		
		user.setEnabled(true);
		user.setShared(true);
		
		em.persist(user);
		
		return user;
	}

}
