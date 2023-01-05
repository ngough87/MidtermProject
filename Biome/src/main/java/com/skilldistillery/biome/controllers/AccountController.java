package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.AddressDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Address;
import com.skilldistillery.biome.entities.User;

@Controller
public class AccountController {
	
	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;

	@RequestMapping("account.do")
	public String viewAccount(HttpSession session) {

		if (session.getAttribute("loggedInUser") == null) {
			return "home";
		} else {
			return "myaccount";
		}
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, Model model) {
		User validatedUser = userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			return "home";
		} else {
			session.setAttribute("loggedInUser", validatedUser);
			model.addAttribute("user", validatedUser);
			return "myaccount";
		}
	}
	
	@RequestMapping(path = "logout.do")
	public String logout(User user, HttpSession session) {
		session.invalidate();
		return "home";
		
	}
	
	@RequestMapping(path = "updateUser.do", method=RequestMethod.GET)
	public String updateUser(@RequestParam int id, User user, Model model) {
		
		if (user.getHidden() == null) {
			user.setHidden(false);
		}
		model.addAttribute("user", userDao.updatePersonalInfo(id, user));
		
		if (user.getAddress() == null) {
			model.addAttribute("address", addressDao.createAddress(user.getAddress()));
		} else {
			model.addAttribute("address", addressDao.updateAddress(user.getAddress().getId(), user.getAddress()));
		}
		return "loggedInUser";
		
	}
	
}
