package com.skilldistillery.ridefinder.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.time.LocalDateTime;
import java.time.Month;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RideCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RideComment rideComment;

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
		rideComment = em.find(RideComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rideComment = null;
	}

	@Test
	void test_Basic() {
		assertNotNull(rideComment);
		assertEquals("What a blast", rideComment.getComment());
		LocalDateTime returnDate = rideComment.getCreateDate();
		assertNotNull(returnDate);
		assertEquals(2023, returnDate.getYear());
		assertEquals(Month.SEPTEMBER, returnDate.getMonth());

	}
	
	@Test
	void test_RideComment_Ride_ManyToOne_Relationship_Mapping() {
		assertNotNull(rideComment);
		assertEquals("STREET VIBRATIONS FALL MOTORCYCLE RALLY", rideComment.getRideId().getName());
	}
	
	@Test
	void test_RideComment_User_ManyToOne__Relationship_Mapping() {
		assertNotNull(rideComment);
		assertEquals("Bill", rideComment.getUser().getFirstName());
		assertEquals(2023, rideComment.getUser().getCreateDate().getYear());

	}
	
	@Test
	void test_RideComment_RideComment_ReplyId_ManyToOne_Relationship_Mapping() {
		assertNotNull(rideComment);
		assertEquals("What a blast", rideComment.getReplyId().getComment());
		assertEquals(2023, rideComment.getReplyId().getCreateDate().getYear());
	}
	
	@Test
	void test_RideComment_RideComment_ReplyId_OneToMany_Relationship_Mapping() {
		assertNotNull(rideComment);
		assertNotNull(rideComment.getRideReplies().size()> 0);
	}
	
}
