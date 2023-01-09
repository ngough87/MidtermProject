package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.biome.data.PlantDAO;
import com.skilldistillery.biome.data.SightingDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Sighting;
import com.skilldistillery.biome.entities.User;

@Controller
public class SightingController {
	
	@Autowired
	private SightingDAO sightingDao;
	@Autowired
	private UserDAO userDao;
	@Autowired
	private PlantDAO plantDao;
	
	
	@RequestMapping(path = "createSighting.do", method = RequestMethod.GET)
	public String createSighting(Sighting sighting, HttpSession session, Model model) {
		
		User user = (User) session.getAttribute("loggedInUser");
		
		sighting.setUser(userDao.findById(user.getId()));
		
		sightingDao.createSighting(sighting);
		
		model.addAttribute("sightings", user.getSightings());
		model.addAttribute("user", user);
		
		return "mySightings";
	}
	
	@RequestMapping(path = "createForm.do", method =RequestMethod.GET)
	public String sightingForm(Model model, HttpSession session) {
		
		model.addAttribute("plants", plantDao.findAll());
		model.addAttribute("user", session.getAttribute("loggedInUser"));

		
		return "createSighting";
	}
	
	@RequestMapping(path = "allSightings.do", method =RequestMethod.GET)
	public String sightingForm(Model model) {
		
		model.addAttribute("sightings", sightingDao.findAll());
		
		return "allsightings";
	}
	
	

}
