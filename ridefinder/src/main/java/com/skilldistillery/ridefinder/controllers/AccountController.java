package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AccountController {
	
	
	@RequestMapping(path = "account.do")
	public String account(HttpSession session) {
		
		System.out.println("account is working");
		if(session.getAttribute("loggedInUser") != null) {
			System.out.println("logged in user");
			return "account";
		}else {
		
			return "login";
		}
		
	}
}
