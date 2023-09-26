package com.skilldistillery.ridefinder.data;

import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;

public interface RideDAO {
	Ride createRide(Ride ride);
	SkillLevel findSkill(int level);
	
	
}
