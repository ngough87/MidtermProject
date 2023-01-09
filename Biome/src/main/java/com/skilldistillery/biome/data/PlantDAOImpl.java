package com.skilldistillery.biome.data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Plant;
import com.skilldistillery.biome.entities.SunExposure;
import com.skilldistillery.biome.entities.Zone;

@Service
@Transactional
public class PlantDAOImpl implements PlantDAO {

	@PersistenceContext
	private EntityManager em;

	@Autowired
	private PlantHasZoneDAO plantHasZoneDao;
	@Autowired
	private SunExposureDAO sunExposureDao;

	@Override
	public List<Plant> searchPlants(String searchTerm) {

		String jpql = "SELECT p FROM Plant p WHERE p.commonName LIKE :keyword "
				+ "OR p.scientificName LIKE :keyword OR p.environmentalNotes LIKE :keyword "
				+ "OR p.edible LIKE :keyword OR p.medicinalProperties LIKE :keyword";

//		String jpql = "SELECT p FROM Plant p WHERE :keyword IN "
//				+ "(p.commonName, p.scientificName)";

		List<Plant> results = new ArrayList<>();

		results = em.createQuery(jpql, Plant.class).setParameter("keyword", "%" + searchTerm + "%").getResultList();

		return results;
	}

	@Override
	public List<Plant> findAll() {

		String jpql = "SELECT p FROM Plant p";

		return em.createQuery(jpql, Plant.class).getResultList();
	}

	@Override
	public Plant createPlant(Plant plant, String[] zones, String[] suns) {
		plant.setCreate_date(LocalDateTime.now());
		plant.setLastUpdated(LocalDateTime.now());

		if (zones != null) {
			for (String zone : zones) {
				plant.addZone(em.find(Zone.class, Integer.parseInt(zone)));
			}
		}

		if (suns != null) {
			for (String sun : suns) {
				plant.addExposure(em.find(SunExposure.class, Integer.parseInt(sun)));
			}
		}

		em.persist(plant);
		em.flush();

		return plant;
	}

	@Override
	public Plant deletePlant(Plant plant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Plant updatePlant(int id, Plant plant, String[] zones, String[] suns) {
		Plant updatePlant = em.find(Plant.class, id);

		if (updatePlant != null) {

			List<Zone> tempZones = new ArrayList<>(updatePlant.getZones());

			for (Zone zone : tempZones) {
				updatePlant.removeZone(zone);
			}

			if (zones != null) {
				for (String zone : zones) {
					updatePlant.addZone(em.find(Zone.class, Integer.parseInt(zone)));
				}
			}

			List<SunExposure> tempSun = new ArrayList<>(updatePlant.getSunExposures());

			for (SunExposure sunExposure : tempSun) {
				updatePlant.removeSunExposure(sunExposure);
			}

			if (suns != null) {
				for (String sun : suns) {
					updatePlant.addExposure(em.find(SunExposure.class, Integer.parseInt(sun)));
				}
			}

			updatePlant.setHabitat(plant.getHabitat());
			updatePlant.setEndangeredStatus(plant.getEndangeredStatus());
			updatePlant.setPlantType(plant.getPlantType());
			updatePlant.setSeason(plant.getSeason());
			updatePlant.setCommonName(plant.getCommonName());
			updatePlant.setScientificName(plant.getScientificName());
			updatePlant.setEnvironmentalNotes(plant.getEnvironmentalNotes());
			updatePlant.setEdible(plant.getEdible());
			updatePlant.setMedicinalProperties(plant.getMedicinalProperties());
			updatePlant.setImageUrl(plant.getImageUrl());
			updatePlant.setLastUpdated(plant.getLastUpdated());
//			updatePlant.setZones(plant.getZones());
//			updatePlant.setSunExposures(plant.getSunExposures());
		}
		return updatePlant;
	}

	@Override
	public Plant findById(int id) {
		return em.find(Plant.class, id);
	}

}
