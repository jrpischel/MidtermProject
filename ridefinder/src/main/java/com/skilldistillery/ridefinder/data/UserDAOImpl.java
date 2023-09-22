package com.skilldistillery.ridefinder.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
			authUser = em.createQuery(jpql, User.class)
					.setParameter("un", user.getUsername())
					.setParameter("pw", user.getPassword())
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid User" + e);
		}
		
		return authUser;
	}
}
