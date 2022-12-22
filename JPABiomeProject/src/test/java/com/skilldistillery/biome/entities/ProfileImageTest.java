package com.skilldistillery.biome.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;


import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class ProfileImageTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private ProfileImage profileImage;
	
	
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
		profileImage = em.find(ProfileImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		profileImage = null;
	}

	@Test
	void test() {
		assertNotNull(profileImage);
		//assertEquals();
		
		
	}

}
