package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.biome.entities.EndangeredStatus;

public class EndangeredStatusDAOImpl implements EndangeredStatusDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public EndangeredStatus findById(int id) {
		return em.find(EndangeredStatus.class, id);
	}

}
