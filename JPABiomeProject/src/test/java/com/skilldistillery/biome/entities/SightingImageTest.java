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

class SightingImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	SightingImage sighting;
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
	    sighting =em.find(SightingImage.class,1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    sighting=null;
	}

	@Test
	void test_SightingImage_mappings() {
	assertNotNull(sighting);
	
	}
}
