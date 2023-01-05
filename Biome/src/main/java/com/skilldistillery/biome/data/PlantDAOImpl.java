package com.skilldistillery.biome.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Habitat;
import com.skilldistillery.biome.entities.Plant;

@Service
@Transactional
public class PlantDAOImpl implements PlantDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Plant> searchPlants(String searchTerm) {
		
		String jpql = "SELECT p FROM Plant p WHERE p.commonName LIKE :keyword "
				+ "OR p.scientificName LIKE :keyword OR p.environmentalNotes LIKE :keyword "
				+ "OR p.edible LIKE :keyword OR p.medicinalProperties LIKE :keyword";
		
//		String jpql = "SELECT p FROM Plant p WHERE :keyword IN "
//				+ "(p.commonName, p.scientificName)";
		
		List<Plant> results = new ArrayList<>();
		
		results = em.createQuery(jpql, Plant.class)
					.setParameter("keyword", "%"+searchTerm+"%")
					.getResultList();
		
		return results;
	}

	@Override
	public List<Plant> findAll() {
		
		String jpql = "SELECT p FROM Plant p";
		
		return em.createQuery(jpql, Plant.class).getResultList();
	}

	@Override
	public Plant createPlant(Plant plant) {
		
		
		
		
		//plant.setHabitat(em.find(Habitat.class));
		
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
	public Plant updatePlant(Plant plant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Plant findById(int id) {
		return em.find(Plant.class, id);
	}

}
