package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.biome.entities.SunExposure;

public class SunExposureDAOImpl implements SunExposureDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public SunExposure findById(int id) {

		return em.find(SunExposure.class, id);
	}

}
