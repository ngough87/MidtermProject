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

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;
	
	
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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	
	
	@Test
	void test_User_entity() {
		assertNotNull(user);
		assertEquals("ADMIN", user.getRole());
	}
	@Test
	void test_User_Address() {
		assertNotNull(user);
		assertEquals("Kansas", user.getAddress().getState());
	}
	@Test
	void test_User_ProfileImage() {// COME BACK TO THIS!
		assertNotNull(user);
			}
	@Test
	void test_User_has_plant() {// COME BACK TO THIS!
		assertNotNull(user);
		
	}
	@Test
	void test_User_is_follower() {// COME BACK TO THIS!
		assertNotNull(user);
		
	}
	@Test
	void test_User_comment() {
		assertNotNull(user);
		assertEquals("Wow, what an amazing post!", user.getComments().get(0).getContents());
		
	}
	@Test
	void test_User_sighting() {
		assertNotNull(user);
		assertTrue(user.getSightings().size() > 0);
	}

}
