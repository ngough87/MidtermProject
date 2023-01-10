package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.EndangeredStatusDAO;
import com.skilldistillery.biome.data.HabitatDAO;
import com.skilldistillery.biome.data.PlantDAO;
import com.skilldistillery.biome.data.PlantHasZoneDAO;
import com.skilldistillery.biome.data.PlantTypeDAO;
import com.skilldistillery.biome.data.SeasonDAO;
import com.skilldistillery.biome.data.SunExposureDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Plant;
import com.skilldistillery.biome.entities.User;

@Controller
public class PlantController {

	@Autowired
	private PlantDAO plantDao;
	@Autowired
	private EndangeredStatusDAO endangeredDao;
	@Autowired
	private HabitatDAO habitatDao;
	@Autowired
	private PlantHasZoneDAO plantHasZoneDao;
	@Autowired
	private PlantTypeDAO plantTypeDao;
	@Autowired
	private SeasonDAO seasonDao;
	@Autowired
	private SunExposureDAO sunExposureDao;
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "plants.do", method = RequestMethod.GET)
	public String plantPage(Model model) {

		model.addAttribute("plants", plantDao.findAll());
		return "allrecords";
	}

	@RequestMapping(path = "searchPlants.do", method = RequestMethod.GET)
	public String searchPlants(@RequestParam("searchTerm") String searchTerm, Model model) {

		model.addAttribute("plants", plantDao.searchPlants(searchTerm));
		return "allrecords";
	}

	@RequestMapping(path = "selectedPlant.do", method = RequestMethod.GET)
	public String selectedPlant(Integer id, Plant plant, Model model, HttpSession session) {
		model.addAttribute("plant", plantDao.findById(id));
		model.addAttribute("user", session.getAttribute("loggedInUser"));

		return "selectedPlant";

	}

	@RequestMapping(path = "createPlant.do", method = RequestMethod.GET)
	public String createdPlant(Plant plant, Model model, HttpServletRequest request, HttpSession session) {
		plant.setEndangeredStatus(endangeredDao.findById(Integer.parseInt(request.getParameter("endangeredStat"))));
		plant.setHabitat(habitatDao.findById(Integer.parseInt(request.getParameter("hab"))));
		plant.setPlantType(plantTypeDao.findById(Integer.parseInt(request.getParameter("plantT"))));
		plant.setSeason(seasonDao.findById(Integer.parseInt(request.getParameter("sea"))));
		plant.setUser(userDao.findById(((User) session.getAttribute("loggedInUser")).getId()));
				
		Plant newPlant = plantDao.createPlant(plant, request.getParameterValues("plant.zone"), request.getParameterValues("sun"));
		
		model.addAttribute("plant", newPlant);
		model.addAttribute("user", session.getAttribute("loggedInUser"));

		return "selectedPlant";
	}

	@RequestMapping(path = "uploadedPlant.do")
	public String uploadedPlant(Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute("loggedInUser"));

		return "createPlant";
	}
	
	@RequestMapping(path = "updatePlant.do", method = RequestMethod.GET)
	public String updatePlant(@RequestParam int id, Model model) {
		
		model.addAttribute("endangeredStatuses", endangeredDao.findAll());
		model.addAttribute("plant", plantDao.findById(id));
		model.addAttribute("zones", plantHasZoneDao.findAll());
		model.addAttribute("habitats", habitatDao.findAll());
		model.addAttribute("sun", sunExposureDao.findAll());
		model.addAttribute("seasons", seasonDao.findAll());
		model.addAttribute("plantTypes", plantTypeDao.findAll());
		
		
		return "updatePlant";
	}
	
	
	@RequestMapping(path="updatedPlant.do", method=RequestMethod.GET)
	public String updatedPlant(HttpServletRequest request, Plant plant, Model model, HttpSession session) {
		
		plant.setEndangeredStatus(endangeredDao.findById(Integer.parseInt(request.getParameter("endangeredStat"))));
		plant.setHabitat(habitatDao.findById(Integer.parseInt(request.getParameter("hab"))));
		plant.setSeason(seasonDao.findById(Integer.parseInt(request.getParameter("sea"))));
		plant.setPlantType(plantTypeDao.findById(Integer.parseInt(request.getParameter("plantT"))));
				
		Plant updatedPlant = plantDao.updatePlant(plant.getId(), plant, request.getParameterValues("zone"), request.getParameterValues("sun"));
		
		model.addAttribute("plant", updatedPlant);
		
		return "selectedPlant";
	}
	
	@RequestMapping(path="deletePlant.do", method=RequestMethod.GET)
	public String deletePlant(@RequestParam int id, Plant plant, HttpServletRequest request, Model model, HttpSession session) {
		
		plantDao.deletePlant(id);
		model.addAttribute("user", session.getAttribute("loggedInUser"));
		return "myaccount";
	}
	
	
	@RequestMapping(path="searchByZone.do", method=RequestMethod.GET)
	public String searchByZone(@RequestParam int zoneId, Model model) {
		
		model.addAttribute("plants", plantDao.findByZone(zoneId));
		return "allrecords";
	}
	

}
