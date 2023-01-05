package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.SunExposure;
@Service
@Transactional
public class SunExposureDAOImpl implements SunExposureDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public SunExposure findById(int id) {

		return em.find(SunExposure.class, id);
	}

}
