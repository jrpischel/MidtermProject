package com.skilldistillery.ridefinder.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.ridefinder.data.RideDAO;
import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private RideDAO rideDAO;
	
	@RequestMapping(path = {"/", "home.do"} )
	private String goHome(Model model) {
		
//		User TESTUSER = new User();
//		TESTUSER.setUsername("admin");
//		TESTUSER.setPassword("password");
//		model.addAttribute("SMOKETEST", userDAO.authenticateUser(TESTUSER));
		
		
		// List all ride
		List<Ride> rides = rideDAO.findAllRides();
		model.addAttribute("rides", rides);

		return "home";
	}

	@RequestMapping(path = "userJoinsRide.do")
	private String userJoinsRide(int theRideId, HttpSession session) {
		Ride ride = rideDAO.findById(theRideId);
		
		User user = (User) session.getAttribute("loggedInUser");

		System.out.println(user.getId());
		
		System.out.println("#####" + ride.getUser());
		

		
		userDAO.addUserToRide(user.getId(), theRideId);
		
		session.setAttribute("loggedInUser", userDAO.findById(user.getId()));

		return "home";
	}
	

}
