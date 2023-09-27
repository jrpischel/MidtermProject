package com.skilldistillery.ridefinder.data;

import java.util.List;

import com.skilldistillery.ridefinder.entities.Club;
import com.skilldistillery.ridefinder.entities.User;

public interface ClubDAO {
	List<Club> findAll();
	Club findById(int clubId);
	Club create(Club newClub, User user);
	Club update(int id, Club updateClub);
	boolean disable(int id);
	boolean enable(int id);
}
