package com.skilldistillery.ridefinder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.ridefinder.data.AddressDAO;
import com.skilldistillery.ridefinder.data.RideDAO;
import com.skilldistillery.ridefinder.entities.Address;
import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;

@Controller
public class RideController {

	@Autowired
	private RideDAO rideDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	
	@RequestMapping(path = "createRide.do", method = RequestMethod.GET)
	public String createRide() {
		return "createRide";
	}
	
	@RequestMapping(path = "makeRideForm.do", method = RequestMethod.GET)
	public String makeRideForm(int skillLevel,String city, String state, Ride ride) {
	
		System.out.println("#########" + ride );
		SkillLevel level = rideDAO.findSkill(skillLevel);
		ride.setSkillLevelId(level);
		Address newAddress = new Address();
		newAddress.setCity(city);
		newAddress.setState(state);
		System.out.println("#########" + newAddress);
		
		 addressDAO.createAddress(newAddress);
		ride.setStartAddressId(newAddress);
		rideDAO.createRide(ride);
		
		return "home";
	}

	
	
}
