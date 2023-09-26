package com.skilldistillery.ridefinder.data;

import java.util.List;

import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;

public interface RideDAO {
	Ride createRide(Ride ride);
	SkillLevel findSkill(int level);
	
	
}
