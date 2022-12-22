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

class CommentRatingTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private CommentRating commentRating;
	
	
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
		CommentRatingId cid = new CommentRatingId();
		cid.setCommentId(1);
		cid.setUserId(1);
		commentRating = em.find(CommentRating.class, new CommentRatingId(1,1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		commentRating = null;
	}
	
	@Test
	void test() {
		assertNotNull(commentRating);
		assertEquals("Test data", commentRating.getRatingReason());
	}

}
