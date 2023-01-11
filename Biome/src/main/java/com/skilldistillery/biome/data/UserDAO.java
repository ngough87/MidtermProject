package com.skilldistillery.biome.data;

import java.util.List;

import org.springframework.dao.DataIntegrityViolationException;

import com.skilldistillery.biome.entities.User;

public interface UserDAO {
	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	User createUser(User user) ;
	User updatePersonalInfo(int id, User user);
	List<User> findAll();
	boolean checkForDuplicateUsername(String username);
	boolean deleteUser (int userId);
}
