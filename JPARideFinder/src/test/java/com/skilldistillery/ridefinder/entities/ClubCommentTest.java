package com.skilldistillery.ridefinder.entities;

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

class ClubCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private ClubComment clubComment;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPARideFinder");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		clubComment = em.find(ClubComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		clubComment = null;
	}

	@Test
	void test() {
		assertNotNull(clubComment);
		assertEquals("Lets go for a ride", clubComment.getComment());
		
	}

}
