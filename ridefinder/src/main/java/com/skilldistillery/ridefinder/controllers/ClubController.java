package com.skilldistillery.ridefinder.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.ridefinder.data.ClubDAO;
import com.skilldistillery.ridefinder.data.UserDAO;
import com.skilldistillery.ridefinder.entities.Club;
import com.skilldistillery.ridefinder.entities.ClubMember;
import com.skilldistillery.ridefinder.entities.User;

@Controller
public class ClubController {

	@Autowired
	private ClubDAO clubDAO;
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = "club.do", method = RequestMethod.GET)
	public String findAllClub(Model model) {
		List<Club> clubs = clubDAO.findAll();
		model.addAttribute("club", clubs);

		return "clubs";

	}
	

	@RequestMapping(path = "createClub.do")
	public String createAccount() {
		return "createClub";
	}
	
	@RequestMapping(path = "clubHome.do")
	public ModelAndView clubHome(Club club, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User user = (User) session.getAttribute("loggedInUser");
		club = clubDAO.findById(club.getId());
		boolean alreadyJoined = false;
		
			for (Club c : user.getClubs()) {
				if(c.getId() == club.getId()) {
					alreadyJoined = true;
				}
			}
		
		mv.addObject("alreadyJoined", alreadyJoined);
		mv.addObject("club", club);
		mv.setViewName("clubHome");
		return mv;
	}
	
	

	@RequestMapping(path = "makeClub.do")
	public ModelAndView createClub(Club newClub, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User clubOwner = (User) session.getAttribute("loggedInUser");
		if(clubOwner != null) {
			clubDAO.create(newClub, clubOwner);
			mv.addObject("club", newClub);
			clubOwner = userDAO.findById(clubOwner.getId());
			session.setAttribute("loggedInUser", clubOwner);
			mv.setViewName("clubHome");
		}else {
			mv.setViewName("redirect:createClub.do");
		}
		return mv;
	}
	
	@RequestMapping(path="joinClub.do", method = RequestMethod.GET)
	public ModelAndView joinClub(Club club, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User clubMember = (User) session.getAttribute("loggedInUser");
		if(clubMember != null) {
			clubDAO.addMember(clubMember, club);
			mv.addObject("club", clubDAO.findById(club.getId()));
			session.setAttribute("loggedInUser", userDAO.findById(clubMember.getId()));
			mv.setViewName("clubHome");
		}
		return mv;
	}
	
	

	@RequestMapping(path = "clubUpdateForm.do", method = RequestMethod.GET, params = "clubId")
	public ModelAndView updateClubForm(int clubId) {
		ModelAndView mv = new ModelAndView();
		Club toUpdate = clubDAO.findById(clubId);
		mv.addObject("club", toUpdate);
		mv.setViewName("updateClub");

		return mv;
	}

	@RequestMapping(path = "clubUpdate.do", method = RequestMethod.GET)
	public ModelAndView updateClubForm(Club club) {
		ModelAndView mv = new ModelAndView();
		clubDAO.update(club.getId(), club);
		mv.addObject("club", clubDAO.findById(club.getId()));
		mv.setViewName("clubHome");

		return mv;

	}

//	@RequestMapping(path = "delete.do", method = RequestMethod.GET)
//	public ModelAndView disableClub(int clubId) {
//		ModelAndView mv = new ModelAndView();
//		clubDAO.enable(clubId);
//		mv.setViewName("deleteResult");
//		return mv;
//	}
	
	@RequestMapping(path = "toggleEnabled.do", method = RequestMethod.GET)
	public ModelAndView enableClub(int clubId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		clubDAO.enable(clubId);
		mv.addObject("club", clubDAO.findById(clubId));
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		session.setAttribute("loggedInUser", userDAO.getUserByUserNameAndPassword(loggedInUser.getUsername(), loggedInUser.getPassword()));
		mv.setViewName("deleteResult");
		return mv;
	}
	
	@RequestMapping(path = "removeMember.do")
	public ModelAndView removeMember(int memberId, int clubId) {
		ModelAndView mv = new ModelAndView();
		clubDAO.removeMember(memberId, clubId);
		Club club = clubDAO.findById(clubId);
		mv.addObject("club", club);
		mv.setViewName("clubHome");
		return mv;
	}
	
	@RequestMapping(path = "removeSelf.do")
	public ModelAndView removeSelf(int memberId, int clubId, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		clubDAO.removeMember(memberId, clubId);
		Club club = clubDAO.findById(clubId);
		mv.addObject("club", club);
		session.setAttribute("loggedInUser", userDAO.findById(loggedInUser.getId()));
		mv.setViewName("account");
		return mv;
	}

}
