package com.skilldistillery.ridefinder.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.ridefinder.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;

}
