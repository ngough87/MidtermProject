package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.EndangeredStatus;
import com.skilldistillery.biome.entities.Habitat;

public interface HabitatDAO {

	Habitat findById(int id);
	
	Habitat creatHabitat(Habitat habitat);
	Habitat updateHabitat(int habitatId, Habitat habitat);
	
	
}
