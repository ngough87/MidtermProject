package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.ProfileImage;

public interface ProfileImageDAO {
	
	ProfileImage findById(int id);
	List <ProfileImage> findAll();

}
