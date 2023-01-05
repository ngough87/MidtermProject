package com.skilldistillery.biome.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.PlantDAO;
import com.skilldistillery.biome.entities.Plant;

@Controller
public class PlantController {
	
	@Autowired
	private PlantDAO plantDao;
	
	
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
	
	
	@RequestMapping(path= "selectedPlant.do", method = RequestMethod.GET)
	public String selectedPlant(Integer id, Plant plant, Model model) {
		model.addAttribute("plant", plantDao.findById(id));
	
		return "selectedPlant";
		
	

}
	
	@RequestMapping(path= "createPlant.do", method = RequestMethod.GET)
	public String createdPlant(Plant plant, Model model) {
		model.addAttribute("plant", plantDao.createPlant(plant));
		
		return "selectedPlant";
	}
	
	
	@RequestMapping(path= "uploadedPlant.do")
	public String uploadedPlant() {
		
		
		return "createPlant";
	}
	
	
	
}
