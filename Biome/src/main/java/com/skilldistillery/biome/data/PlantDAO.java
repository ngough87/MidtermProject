package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Plant;

public interface PlantDAO {
	
	List<Plant> searchPlants(String searchTerm);
	List<Plant> findAll();
	Plant findById(int id);
	Plant createPlant(Plant plant);
	Plant deletePlant(Plant plant);
	Plant updatePlant(Plant plant);

}
