package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.User;

@Controller
public class AccountController {
	
	@Autowired
	private UserDAO userDao;

	@RequestMapping("account.do")
	public String viewAccount(HttpSession session) {

		if (session.getAttribute("loggedInUser") == null) {
			return "home";
		} else {
			return "myaccount";
		}
	}
	
	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session) {
		User validatedUser = userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			return "home";
		} else {
			session.setAttribute("loggedInUser", validatedUser);
			return "myaccount";
		}
	}

}
