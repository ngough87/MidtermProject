package com.skilldistillery.biome.data;

import java.util.List;

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
	
	@Override
	public List<Zone> findAll() {
		String jpql = "SELECT z FROM Zone z";
		
		return em.createQuery(jpql, Zone.class).getResultList();
		
	}

}
