package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.ridefinder.data.AddressDAO;
import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.Address;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class AccountController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private AddressDAO addressDAO;
	
	@RequestMapping(path = "account.do")
	public String account(HttpSession session) {
		
		
		
		if(session.getAttribute("loggedInUser") != null) {
			return "account";
		}else {
		
			return "login";
		}
		
	}
	
	@RequestMapping(path = "createAccount.do")
	public String createAccount() {
		return "createAccount";
	}
	
	@RequestMapping(path = "profile.do")
	public String viewProfile(int userId, Model model) {
		model.addAttribute("user", userDAO.findById(userId));
		return "profile";
	}
	
	@RequestMapping(path = "makeAccount.do")
	public String makeAccount(User user) {
		
		userDAO.createUserAccount(user.getUsername(), user.getPassword());
		return "account";
	}
	

	@RequestMapping(path = "updateAccountForm.do", method = RequestMethod.GET)
	public ModelAndView update(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User userToBeUpdated = (User) session.getAttribute("loggedInUser");
		mv.addObject("user", userToBeUpdated);
		mv.setViewName("updateAccount");
		return mv;
	}

	@RequestMapping(path = "updateAccount.do", method = RequestMethod.GET)
	public ModelAndView update(User user, HttpSession session, String city, String state) {
		ModelAndView mv = new ModelAndView();
		
		Address newAddress = new Address();
		newAddress.setCity(city);
		newAddress.setState(state);
		addressDAO.createAddress(newAddress);
		
		user.setAddress(newAddress);
		
		user = userDAO.updateUser(user);
		
		
		session.setAttribute("loggedInUser", user);
		mv.setViewName("account");
		return mv;
	}
}








