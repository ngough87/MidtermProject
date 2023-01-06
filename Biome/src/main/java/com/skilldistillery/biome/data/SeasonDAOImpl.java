package com.skilldistillery.biome.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Season;

@Service
@Transactional
public class SeasonDAOImpl implements SeasonDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Season findById(int id) {
		return em.find(Season.class, id);
	}

	@Override
	public List<Season> findAll() {
		String jpql = "SELECT s FROM Season s";
		return em.createQuery(jpql, Season.class).getResultList();
	}
	
	

}
