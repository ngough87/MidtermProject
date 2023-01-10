package com.skilldistillery.biome.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.biome.data.CommentDAO;
import com.skilldistillery.biome.data.SightingDAO;
import com.skilldistillery.biome.data.UserDAO;
import com.skilldistillery.biome.entities.Comment;
import com.skilldistillery.biome.entities.Sighting;
import com.skilldistillery.biome.entities.User;

@Controller
public class CommentController {

	@Autowired
	private CommentDAO commentDao;

	@Autowired
	private SightingDAO sightingDao;

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = "comment.do", method = RequestMethod.GET)
	public String login(@RequestParam int sightingId, HttpSession session, Model model, Comment comment) {

		int userId = ((User) session.getAttribute("loggedInUser")).getId();
		model.addAttribute("sighting", sightingDao.findById(sightingId));
		
		commentDao.createComment(comment, sightingId, userId);
		return "selectedSighting";
	}

}
