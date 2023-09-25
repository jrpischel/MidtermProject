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

class UserCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserComment userComment;

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
		userComment = em.find(UserComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		userComment = null;
	}

	@Test
	void test_Basic() {
		assertNotNull(userComment);
		assertEquals("Check this out!", userComment.getComment());
		LocalDateTime returnDate = userComment.getCreateDate();
		assertNotNull(returnDate);
		assertEquals(2023, returnDate.getYear());
		assertEquals(Month.SEPTEMBER, returnDate.getMonth());

	}
	
	@Test
	void test_UserComment_RecipientId_ManyToOne_Relationship_Mapping() {
		assertNotNull(userComment);
		assertEquals("Bill",userComment.getRecipientId().getFirstName());

	}
	
	@Test
	void test_UserComment_UserId_ManyToOne_Relationship_Mapping() {
		assertNotNull(userComment);
		assertEquals("admin", userComment.getUser().getUsername());

	}
	
	//cant test right now because DB does not have any info for inreply_id column
	
//	@Test
//	void test_UserComment_UserComment_ManyToOne_Relationship_Mapping() {
//		assertNotNull(userComment);
//		assertEquals(null, userComment.getUserComment().getComment());
//
//	}
	
	@Test
	void test_UseComment_UserReplies_OneToMany_Relationship_Mapping() {
		assertNotNull(userComment);
		assertNotNull(userComment.getUserReplies().size()> 0);

	}
	
}
