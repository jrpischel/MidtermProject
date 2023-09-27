package com.skilldistillery.ridefinder.data;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.ridefinder.entities.User;


public interface UserDAO {
	User authenticateUser(User user);
	User getUserByUserNameAndPassword(String userName, String password);
	User createUserAccount(String userName, String password);
	User updateUser(User user);
	User findById(int userId);
	void addUserToRide(int userId, int rideId);
}
