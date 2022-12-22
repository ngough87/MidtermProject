package com.skilldistillery.biome.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SightingRatingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	SightingRating sighting;
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABiomeProject");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	
	@BeforeEach
	void setUp() throws Exception {
	    
	    em = emf.createEntityManager();
		SightingRatingId sid = new SightingRatingId();
		sid.setUserId(1);
		sid.setSightingId(1);
		sighting = em.find(SightingRating.class, sid);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    sighting=null;
	}

	@Test
	void test_SightingRating_mappings() {
	assertNotNull(sighting);
	
	}

}
