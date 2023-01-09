package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.AddressDAO;
import com.skilldistillery.biome.data.ProfileImageDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Address;
import com.skilldistillery.biome.entities.User;

@Controller
public class AccountController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private AddressDAO addressDao;
	@Autowired
	private ProfileImageDAO profileImageDao;

	@RequestMapping("account.do")
	public String viewAccount(HttpSession session, Model model) {

		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());
		
		if (user == null) {
			return "home";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("address", user.getAddress());
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
			model.addAttribute("address", validatedUser.getAddress());
			return "myaccount";
		}
	}

	@RequestMapping(path = "logout.do")
	public String logout(User user, HttpSession session) {
		session.invalidate();
		return "home";

	}

	@RequestMapping(path = "updateUser.do", method = RequestMethod.GET)
	public String updateUser(@RequestParam int id, User user, Address address, Model model, HttpServletRequest request) {

		if (user.getHidden() == null) {
			user.setHidden(false);
		}
		model.addAttribute("user", userDao.updatePersonalInfo(id, user));

		User updatedUser = userDao.findById(id);
		
		updatedUser.setProfileImage(profileImageDao.findById(Integer.parseInt(request.getParameter("profileImage.id"))));

		model.addAttribute("address", addressDao.updateAddress(updatedUser.getAddress().getId(), address));
		
		model.addAttribute("profileImage", updatedUser.getProfileImage().getImageUrl());

		return "loggedInUser";

	}

	
	@RequestMapping(path = { "myList.do" })
	public String seeMyFavList(Model model) {
		return "myFavPlantList";
	}
	
	@RequestMapping(path = { "mySightings.do" })
	public String seeMySightings(Model model) {
		return "mySightings";
	}
	@RequestMapping(path = { "myFollowedUsers.do" })
	public String seeMyFollowedUsers(Model model) {
		return "followedUsers";
	}
	
	@RequestMapping(path = { "myAccount.do" })
	public String seeMyAccount(Model model) {
		return "loggedInUser";
	}
	
	
	@RequestMapping(path = { "followUser.do" })
	public String followedUser(@RequestParam int id, Model model, HttpSession session) {
		
		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());
		
		user.addFollower(userDao.findById(id));
		 
		model.addAttribute("user", userDao.findById(id));
		
		return "selectedUser";
	}
	@RequestMapping(path = { "followedUsers.do" })
	public String myFollowedUsers(@RequestParam int id, Model model, HttpSession session) {
		
		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());
		
		model.addAttribute("followedUser", user.getFollowedUsers());
		
		
		return "followedUsers";
	}
	
	
}
