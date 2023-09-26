package com.skilldistillery.ridefinder.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.ridefinder.data.ClubDAO;
import com.skilldistillery.ridefinder.entities.Club;

@Controller
public class ClubController {

	@Autowired
	private ClubDAO clubDAO;

	@RequestMapping(path = "club.do", method = RequestMethod.GET)
	public String findAllClub(Model model) {
		List<Club> clubs = clubDAO.findAll();
		model.addAttribute("club", clubs);

		return "clubs";

	}

	@RequestMapping(path = "createClub.do", method = RequestMethod.GET)
	public ModelAndView createClub(Club newClub) {
		ModelAndView mv = new ModelAndView();
		clubDAO.create(newClub);
		mv.setViewName("clubHome");
		return mv;

	}

	@RequestMapping(path = "clubUpdateForm.do", method = RequestMethod.GET, params = "clubId")
	public ModelAndView updateClubForm(int clubId) {
		ModelAndView mv = new ModelAndView();
		//Club toUpdate = clubDAO.findById(clubId);
		//mv.addObject("club", toUpdate);
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

	public ModelAndView deleteClub(int clubId) {
		ModelAndView mv = new ModelAndView();
		clubDAO.delete(clubId);
		mv.setViewName("deleteResult");

		return mv;
	}

}
