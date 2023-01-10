package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.biome.data.AddressDAO;
import com.skilldistillery.biome.data.ProfileImageDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Address;
import com.skilldistillery.biome.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;
	@Autowired
	private ProfileImageDAO profileImageDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDao.findById(1)); // delete later
		return "home";
	}
	
	@RequestMapping(path="register.do", method=RequestMethod.GET)
	public String register(User user, Model model, HttpSession session) {
		Address address = new Address();
		addressDao.createAddress(address);
		user.setAddress(address);
		model.addAttribute("user", userDao.createUser(user));
		model.addAttribute("profileImage", profileImageDao.findAll());
		session.setAttribute("loggedInUser", user);
		
		return "myaccount";
	}
	

}