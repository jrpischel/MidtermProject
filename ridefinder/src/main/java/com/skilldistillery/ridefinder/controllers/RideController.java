package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.ridefinder.data.AddressDAO;
import com.skilldistillery.ridefinder.data.RideDAO;
import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.Address;
import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class RideController {

	@Autowired
	private RideDAO rideDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Autowired
	private UserDAO userDAO;
	
	
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
			Ride ride,
			HttpSession session) {
	
		System.out.println("#########" + ride );
		
		
		
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

	@RequestMapping(path = "rideDisplay.do")
	public String rideDisplay(Model model, int theRideId) {
		
		Ride ride = rideDAO.findById(theRideId);
		
		model.addAttribute("ride", ride);
		
		return "displayRide";
	}
	
	
}
