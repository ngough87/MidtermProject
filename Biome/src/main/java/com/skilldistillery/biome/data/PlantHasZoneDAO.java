package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.Zone;

public interface PlantHasZoneDAO {

	Zone createZone(Zone zone);
	Zone updateZone(int zoneId, Zone zone);
	
}
