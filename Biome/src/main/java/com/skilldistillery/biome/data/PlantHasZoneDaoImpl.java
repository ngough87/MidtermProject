package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Zone;

@Service
@Transactional
public class PlantHasZoneDaoImpl implements PlantHasZoneDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Zone createZone(Zone zone) {
		
		return null;
	}

	@Override
	public Zone updateZone(int zoneId, Zone zone) {
		return null;
	}

	@Override
	public Zone findById(int id) {
		
		
		Zone zone = em.find(Zone.class, id);
		
		return zone;
	}

}
