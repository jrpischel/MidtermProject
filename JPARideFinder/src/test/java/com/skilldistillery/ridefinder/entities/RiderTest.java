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

class RiderTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Rider rider;

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
		rider = em.find(Rider.class, new RiderId(1,1));
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rider = null;
	}

	@Test
	void test() {
		assertNotNull(rider);
		assertEquals("Big Bill", rider.getUser().getNickname());
	}

}
