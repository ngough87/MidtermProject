package com.skilldistillery.biome.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@RequestMapping(path = "createSighting.do", method = RequestMethod.POST)
	public String createSighting(Sighting sighting, HttpServletRequest request, HttpSession session, Model model, RedirectAttributes redir) {

		User user = (User) session.getAttribute("loggedInUser");
		user = userDao.findById(user.getId());
		sighting.setUser(user);
		sighting.setPlant(plantDao.findById(Integer.parseInt(request.getParameter("plantName"))));

		if (request.getParameter("lat") != null) {
			sighting.setLatitude(Double.parseDouble(request.getParameter("lat")));
		}
		if (request.getParameter("long") != null) {
			sighting.setLongitude(Double.parseDouble(request.getParameter("long")));
		}

		sightingDao.createSighting(sighting);

		user.addSighting(sighting);
		
		redir.addAttribute("userId", user.getId());

		return "redirect:mySightingsRedir.do";
	}
	
	@GetMapping(path="mySightingsRedir.do") 
	public String sightingRedirect(@RequestParam int userId, Model model) {
		
		User user = userDao.findById(userId);
		model.addAttribute("user", user);
		model.addAttribute("sightings", user.getSightings());
		
		return "mySightings";
	}
	
	

	@RequestMapping(path = "createForm.do", method = RequestMethod.GET)
	public String sightingForm(Model model, HttpSession session) {

		model.addAttribute("plants", plantDao.findAll());
		model.addAttribute("user", session.getAttribute("loggedInUser"));

		return "createSighting";
	}

	@RequestMapping(path = "allSightings.do", method = RequestMethod.GET)
	public String allSightings(Model model, HttpSession session) {

		model.addAttribute("sightings", sightingDao.findAll());

		User user = ((User) session.getAttribute("loggedInUser"));

		if (user != null) {
			model.addAttribute("user", userDao.findById(user.getId()));
		}

		return "allsightings";
	}

	@RequestMapping(path = "mySightings.do", method = RequestMethod.GET)
	public String sightingPage(Model model, HttpSession session) {

		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());

		model.addAttribute("user", user);
		model.addAttribute("sightings", user.getSightings());

		return "mySightings";
	}

	@RequestMapping(path = "selectedSightings.do", method = RequestMethod.GET)
	public String selectedSighting(Sighting sighting, Model model, HttpSession session) {

		model.addAttribute("sighting", sightingDao.findById(sighting.getId()));
		
		User user = (User) session.getAttribute("loggedInUser");

		if (user != null) {
			model.addAttribute("user", userDao.findById(user.getId()));
		}

		return "selectedSighting";
	}

	@RequestMapping(path = "selectedUser.do", method = RequestMethod.GET)
	public String selectedUser(@RequestParam int id, Model model) {

		model.addAttribute("user", userDao.findById(id));

		return "selectedUser";
	}

	@RequestMapping(path = "updateSighting.do", method = RequestMethod.GET)
	public String updateSightingForm(@RequestParam int id, Model model, HttpSession session) {
		
		User user = new User();
		if (session.getAttribute("loggedInUser") != null) {
			user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());
		}
		
		model.addAttribute("user", user);
		model.addAttribute("sighting", sightingDao.findById(id));

		return "updateSighting";
	}

	@RequestMapping(path = "updatedSighting.do", method = RequestMethod.GET)
	public String updatedSighting(@RequestParam int id, Model model, HttpSession session, Sighting sighting) {

		model.addAttribute("sighting", sightingDao.updateSighting(id, sighting));

		User user = (User) session.getAttribute("loggedInUser");

		if (user != null) {
			model.addAttribute("user", userDao.findById(user.getId()));
		}

		return "selectedSighting";
	}

}
