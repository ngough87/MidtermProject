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

class PlantTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Plant plant;
	
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPABiomeProject");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf = null;
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		plant = em.find(Plant.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		plant = null;
	}

	@Test
	void test_Plant_entity() {
		assertNotNull(plant);
		assertEquals("Spreading Dogbane", plant.getCommonName());
		
		assertEquals("Woodland", plant.getHabitat().getName());
		assertEquals("G5", plant.getEndangeredStatus().getName());
		assertEquals("Herbaceous", plant.getPlantType().getName());
		assertEquals("Perrenial", plant.getSeason().getName());
		assertEquals(7, plant.getZones().size());
		assertTrue(plant.getZones().size() > 0);
		
		assertEquals(3, plant.getSunExposures().size());
		
	}

}
