package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Habitat;

public interface HabitatDAO {

	Habitat findById(int id);
	
	Habitat creatHabitat(Habitat habitat);
	Habitat updateHabitat(int habitatId, Habitat habitat);
	List<Habitat> findAll();
	
	
}
