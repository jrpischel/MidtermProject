package com.skilldistillery.ridefinder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path = {"/", "home.do"} )
	private String goHome(Model model) {
		
		User TESTUSER = new User();
		

		TESTUSER.setUsername("admin");
		TESTUSER.setPassword("password");
		

		model.addAttribute("SMOKETEST", userDAO.authenticateUser(TESTUSER));
		

		return "home";
	}

}
