package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Sighting;

public interface SightingDAO {
	
	Sighting findById(int id);
	List<Sighting> findAll();
	List<Sighting> findByKeyword(String keyword);
	List<Sighting> findByUserId(int id);
	Sighting createSighting(Sighting sighting);
	Sighting updateSighting(int id, Sighting sighting);
	boolean deleteSighting(int id);

}
