package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.SunExposure;

public interface SunExposureDAO {
	
	SunExposure findById(int id);
	List<SunExposure> findAll();

}
