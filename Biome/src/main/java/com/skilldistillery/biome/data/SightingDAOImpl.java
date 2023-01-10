package com.skilldistillery.biome.data;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Sighting;

@Service
@Transactional
public class SightingDAOImpl implements SightingDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Sighting> findAll() {
		String jpql = "SELECT s FROM Sighting s";
		return em.createQuery(jpql, Sighting.class).getResultList();
	}

	@Override
	public List<Sighting> findByKeyword(String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sighting> findByUserId(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Sighting createSighting(Sighting sighting) {
		
		sighting.setDatePosted(LocalDateTime.now());
		
		
		em.persist(sighting);
		em.flush();
		
		return sighting;
	}

	@Override
	public Sighting updateSighting(int id, Sighting sighting) {
		Sighting updated = em.find(Sighting.class, id);
		
		if (updated != null) {
			updated.setLatitude(sighting.getLatitude());
			updated.setLongitude(sighting.getLongitude());
			updated.setDescription(sighting.getDescription());
		}
				
		return updated;
	}

	@Override
	public boolean deleteSighting(int id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Sighting findById(int id) {
		
		
		
		
		return em.find(Sighting.class, id);
	}

}
