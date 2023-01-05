package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.User;

public interface UserDAO {
	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	User updatePersonalInfo(int id, User user);
}
