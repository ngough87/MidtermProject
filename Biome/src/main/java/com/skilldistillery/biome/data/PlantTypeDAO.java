package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.PlantType;

public interface PlantTypeDAO {

	PlantType findById(int id);
	List<PlantType> findAll();
}
