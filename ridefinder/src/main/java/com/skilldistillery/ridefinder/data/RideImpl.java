package com.skilldistillery.ridefinder.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Ride;
import com.skilldistillery.ridefinder.entities.SkillLevel;

@Service
@Transactional
public class RideImpl implements RideDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Ride createRide(Ride ride) {

		em.persist(ride);
		return ride;
	}

	@Override
	public SkillLevel findSkill(int level) {
		return em.find(SkillLevel.class, level);
	}



}
