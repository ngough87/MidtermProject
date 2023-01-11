package com.skilldistillery.biome.controllers;

import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.AddressDAO;
import com.skilldistillery.biome.data.PlantHasZoneDAO;
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
	@Autowired
	private PlantHasZoneDAO zoneDao;

	@RequestMapping("account.do")
	public String viewAccount(HttpSession session, Model model) {

		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());

		if (user == null) {
			return "home";
		} else {
			model.addAttribute("user", user);
			model.addAttribute("address", user.getAddress());
			model.addAttribute("profileImage", profileImageDao.findAll());
			return "myaccount";
		}
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session, Model model) {

		try {
			User usernameMatch = userDao.findByUsername(user.getUsername());
			if (usernameMatch.getSalt() != null) {
			byte[] salt = usernameMatch.getSalt();
			
			PBEKeySpec pbeKeySpec = new PBEKeySpec("password".toCharArray(), salt, 10, 512);
			SecretKeyFactory skf = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA512");
			byte[] hash = skf.generateSecret(pbeKeySpec).getEncoded();

			String base64Hash = Base64.getMimeEncoder().encodeToString(hash);

			user.setPassword(base64Hash);
			}

		} catch (NoSuchAlgorithmException e) {
			return "home";

		} catch (InvalidKeySpecException k) {
			return "home";
		}

		User validatedUser = userDao.findByUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			return "home";
		} else {
			session.setAttribute("loggedInUser", validatedUser);
			model.addAttribute("user", validatedUser);
			model.addAttribute("address", validatedUser.getAddress());
			return "loggedInUser";
		}
	}

	@RequestMapping(path = "logout.do")
	public String logout(User user, HttpSession session) {
		session.invalidate();
		return "home";

	}

	@RequestMapping(path = "updateUser.do", method = RequestMethod.GET)
	public String updateUser(@RequestParam int userId, int zoneId, User user, Address address, Model model,
			HttpServletRequest request) {

		if (user.getHidden() == null) {
			user.setHidden(false);
		}
		model.addAttribute("user", userDao.updatePersonalInfo(userId, user));

		User updatedUser = userDao.findById(userId);

		updatedUser.getAddress().setZone(zoneDao.findById(zoneId));

		updatedUser
				.setProfileImage(profileImageDao.findById(Integer.parseInt(request.getParameter("profileImage.id"))));

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

	@RequestMapping(path = { "myAccount.do" })
	public String seeMyAccount(Model model, HttpSession session) {

		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());

		model.addAttribute("user", user);
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
	public String myFollowedUsers(Model model, HttpSession session) {

		User user = userDao.findById(((User) session.getAttribute("loggedInUser")).getId());

		model.addAttribute("followedUser", user.getFollowedUsers());

		return "followedUsers";
	}

	@RequestMapping(path = "allUsers.do")
	public String allUsers(Model model) {

		model.addAttribute("users", userDao.findAll());

		return "allUsers";
	}

	@RequestMapping(path = "selectedUser.do")
	public String selectedUser(@RequestParam int id, Model model) {

		model.addAttribute("user", userDao.findById(id));
		model.addAttribute("address", addressDao.findById(id));

		return "selectedUser";
	}

	@RequestMapping("deleteUser.do")
	public String deleteUser(int id, Model model, HttpSession session) {
		boolean user = userDao.deleteUser(id);
		model.addAttribute("user", user);
		session.invalidate();
		return "home";

	}
}
