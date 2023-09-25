package com.skilldistillery.ridefinder.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;
	
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public ModelAndView loginGet(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {
			mv.setViewName("home");
		} else {
			mv.setViewName("login");
		}
		
		return mv;
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public ModelAndView loginPost(User user, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		user = dao.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		if (user != null) {
			session.setAttribute("loggedInUser", user);
			mv.setViewName("account");
		} else {
			mv.setViewName("login");
		}
		return mv;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		session.invalidate();
		return "home";
	}
	
	
}
