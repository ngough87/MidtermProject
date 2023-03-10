package com.skilldistillery.biome.entities;


import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SightingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	Sighting sighting;
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
	    sighting =em.find(Sighting.class,1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    sighting=null;
	}

	@Test
	void test_Sighting_mappings() {
	assertNotNull(sighting);
	
	}
	@Test
	void test_Sighting_user() {
		assertNotNull(sighting);
		assertEquals("admin", sighting.getUser().getUsername());
	}
	
	@Test
	void test_Sighting_plant() {
		assertNotNull(sighting);
		assertEquals("Spreading Dogbane", sighting.getPlant().getCommonName());
	}
	@Test
	void test_Sighting_comment() {
		assertNotNull(sighting);
		assertEquals("Wow, what an amazing post!" , sighting.getComments().get(0).getContents());
	}
	@Test
	void test_Sighting_sightingImage() {
		assertNotNull(sighting);
		assertEquals(0 , sighting.getSightingImages().size());
	}
}
