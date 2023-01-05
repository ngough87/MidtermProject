package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.PlantType;

@Service
@Transactional
public class PlantTypeDAOImpl implements PlantTypeDAO {


	@PersistenceContext
	private EntityManager em;

	@Override
	public PlantType findById(int id) {
		return em.find(PlantType.class, id);
	}

}
