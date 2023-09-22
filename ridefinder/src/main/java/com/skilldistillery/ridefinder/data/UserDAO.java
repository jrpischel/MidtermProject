package com.skilldistillery.ridefinder.data;

import com.skilldistillery.ridefinder.entities.User;

public interface UserDAO {
	User authenticateUser(User user);
}
