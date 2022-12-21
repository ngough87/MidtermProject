package com.skilldistillery.biome.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.biome.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
}
