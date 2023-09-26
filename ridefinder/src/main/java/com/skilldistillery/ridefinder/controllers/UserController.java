package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(path = "account.do", method = RequestMethod.GET)
	public ModelAndView findById(int userId) {
		ModelAndView mv = new ModelAndView();
		User user = userDAO.findById(userId);
		mv.addObject("user", user);
		mv.setViewName("home");
		return mv;
	}
	
	

}
