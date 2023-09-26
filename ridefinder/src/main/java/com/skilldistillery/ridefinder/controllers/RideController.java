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
	public String makeRideForm(int skillLevelId, 
			String street,
			String city,
			String state, 
			String zip,
			Ride ride) {
	
		System.out.println("#########" + ride );
		
		
		//System.out.println("#######" + "TIME :" + ride.getStartTime());
		// LocalTime time = LocalTime.of(13, 44) 
		
		SkillLevel level = rideDAO.findSkill(skillLevelId);
		ride.setSkillLevel(level);
		Address newAddress = new Address();
		newAddress.setStreet(street);
		newAddress.setCity(city);
		newAddress.setState(state);
		newAddress.setZip(zip);
		
		
		System.out.println("#########" + newAddress);
		
		 addressDAO.createAddress(newAddress);
		ride.setStartAddressId(newAddress);
		rideDAO.createRide(ride);
		
		return "home";
	}

	
	
}
