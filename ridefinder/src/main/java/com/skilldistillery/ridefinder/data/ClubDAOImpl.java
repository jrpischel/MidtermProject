package com.skilldistillery.ridefinder.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Club;
@Service
@Transactional
public class ClubDAOImpl implements ClubDAO  {
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public List<Club> findAll() {
		List<Club> clubs = null;
		String jpql = "SELECT c FROM Club c";
		clubs = em.createQuery(jpql, Club.class)
				.getResultList();
		return clubs;
	}

	@Override
	public Club create(Club newClub) {
		em.persist(newClub);
		
		return newClub;
	}

	@Override
	public Club update(int id, Club updateClub) {
		Club dbClub = em.find(Club.class, id);
		if(dbClub != null) {
			dbClub.setName(updateClub.getName());
			dbClub.setPhotoUrl(updateClub.getPhotoUrl());
			dbClub.setDescription(updateClub.getDescription());
			dbClub.setShared(updateClub.isShared());
			
		}
		
		return dbClub;
	}

	@Override
	public boolean delete(int id) {
		Club dbClub = em.find(Club.class, id);
		boolean deleted = false;
		if(dbClub != null) {
			em.remove(dbClub);
			deleted = !em.contains(dbClub);
		}
		
		return deleted;
	}

	@Override
	public Club findById(int clubId) {
		return em.find(Club.class, clubId);
	}

}
