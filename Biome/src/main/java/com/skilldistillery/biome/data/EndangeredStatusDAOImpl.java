package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.EndangeredStatus;
@Service
@Transactional
public class EndangeredStatusDAOImpl implements EndangeredStatusDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public EndangeredStatus findById(int id) {
		return em.find(EndangeredStatus.class, id);
	}

}
