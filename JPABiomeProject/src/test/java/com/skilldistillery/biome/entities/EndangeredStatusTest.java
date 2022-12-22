package com.skilldistillery.biome.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class EndangeredStatusTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private EndangeredStatus status;
	
	
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
		status = em.find(EndangeredStatus.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		status = null;
	}
	
	
	@Test
	void test_EndangeredStatus_entity() {
		assertNotNull(status);
		assertEquals("Presumed Extinct", status.getDescription());
		
		assertTrue(status.getPlants().size() == 0);
	}

}
