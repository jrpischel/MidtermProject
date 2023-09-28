package com.skilldistillery.ridefinder.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.Rider;
import com.skilldistillery.ridefinder.entities.RiderId;
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
		
		// user.setCreateDate(LocalDateTime.now());
		
		em.persist(user);
		
		return user;
	}

	@Override
	public User updateUser(User updatedUser) {
		User user = em.find(User.class, updatedUser.getId());
		
		
		user.setRole(updatedUser.getRole());
		user.setFirstName(updatedUser.getFirstName());
		user.setLastName(updatedUser.getLastName());
		user.setNickname(updatedUser.getNickname());
		user.setPhotoURL(updatedUser.getPhotoURL());
		user.setDescription(updatedUser.getDescription());
		user.setShared(updatedUser.isShared());
		user.setAddress(updatedUser.getAddress());
		
		// user.setLastUpdate(LocalDateTime.now());
		
		return user;
	}
	
	@Override
	public User findById (int userId) {
		User user = em.find(User.class, userId);
		user.getClubs().size();
		user.getRides().size();
		
		user.getRiders().size(); 
		return user;
	}

	@Override
	public void addUserToRide(int userId, int rideId) {
		
		RiderId riderId = new RiderId(userId, rideId);
		Rider rider = new Rider();
		rider.setId(riderId);
		
		Ride ride = em.find(Ride.class, rideId);
		rider.setRide(ride);
		
		User user = em.find(User.class, userId);

		rider.setUser(user);
		
		// what about???
		List<Rider> riders = user.getRiders();
		riders.add(rider);
		user.setRiders(riders);
		em.persist(user);
		em.persist(rider);
		 
		
		// we can add rating and comments here
		// TODO maybe
		
		
		
	}


}
