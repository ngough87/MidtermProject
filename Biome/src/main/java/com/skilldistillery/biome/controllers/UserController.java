package com.skilldistillery.biome.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.findById(1)); // delete later
		return "home";
	}
	
	@RequestMapping(path="register.do", method=RequestMethod.GET)
	public String register(User user, Model model) {
		
		model.addAttribute("user", userDao.createUser(user));
		
		return "myaccount";
	}
	

}