package com.skilldistillery.biome.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.ProfileImage;

@Service
@Transactional
public class ProfileImageDAOImpl implements ProfileImageDAO {
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public ProfileImage findById(int id) {
		return em.find(ProfileImage.class, id);
	}

}
