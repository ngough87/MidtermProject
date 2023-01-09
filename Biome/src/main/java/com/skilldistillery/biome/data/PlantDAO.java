package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Plant;

public interface PlantDAO {
	
	List<Plant> searchPlants(String searchTerm);
	List<Plant> findAll();
	Plant findById(int id);
	Plant createPlant(Plant plant, String[] zones, String[] suns);
	boolean deletePlant(int id);
	Plant updatePlant(int id, Plant plant, String[] zones, String [] suns);

}
