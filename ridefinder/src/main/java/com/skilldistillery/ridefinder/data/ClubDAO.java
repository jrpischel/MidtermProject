package com.skilldistillery.ridefinder.data;

import java.util.List;

import com.skilldistillery.ridefinder.entities.Club;

public interface ClubDAO {
	List<Club> findAll();
	Club findById(int clubId);
	Club create(Club newClub);
	Club update(int id, Club updateClub);
	boolean delete(int id);
}
