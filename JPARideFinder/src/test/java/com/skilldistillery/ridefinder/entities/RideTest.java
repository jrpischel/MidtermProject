package com.skilldistillery.ridefinder.entities;

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

class RideTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Ride ride;

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
		ride = em.find(Ride.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		ride = null;
	}

	@Test
	void test() {
		assertNotNull(ride);
		assertEquals("STREET VIBRATIONS FALL MOTORCYCLE RALLY", ride.getName());
		
	}
	
	@Test
	void test_toString() {
		assertNotNull(ride);
		assertNotNull(ride.toString());
	}
	
	@Test
	void test_get_ride_comments() {

		assertNotNull(ride);
		assertNotNull(ride.getRideComments());
		assertTrue(ride.getRideComments().size() > 0);

	}

}
