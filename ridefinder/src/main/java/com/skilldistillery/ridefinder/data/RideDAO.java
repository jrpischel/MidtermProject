package com.skilldistillery.ridefinder.data;

import java.util.List;

import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;

public interface RideDAO {
	Ride createRide(Ride ride);
	
	Ride findById(int id);
	
	SkillLevel findSkill(int level);
	
	List<Ride> findAllRides();
	
}
