package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Zone;

public interface PlantHasZoneDAO {

	List<Zone> findById(int id);
	
	
	Zone createZone(Zone zone);
	Zone updateZone(int zoneId, Zone zone);
	
}
