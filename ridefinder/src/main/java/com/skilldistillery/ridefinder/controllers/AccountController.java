package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class AccountController {
	
	@Autowired
	private UserDAO userDAO;
	
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
	
	@RequestMapping(path = "makeAccount.do")
	public String makeAccount(User user) {
		
		userDAO.createUserAccount(user.getUsername(), user.getPassword());
		return "account";
	}
}








