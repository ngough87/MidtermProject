package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Habitat;
@Service
@Transactional
public class HabitatDaoImpl implements HabitatDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Habitat creatHabitat(Habitat habitat) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Habitat updateHabitat(int habitatId, Habitat habitat) {
		// TODO Auto-generated method stub
		return null;
	}

}
