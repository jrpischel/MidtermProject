package com.skilldistillery.ridefinder.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.ridefinder.entities.Club;
import com.skilldistillery.ridefinder.entities.ClubMember;
import com.skilldistillery.ridefinder.entities.ClubMemberId;
import com.skilldistillery.ridefinder.entities.User;

@Service
@Transactional
public class ClubDAOImpl implements ClubDAO {
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Club> findAll() {
		List<Club> clubs = null;
		String jpql = "SELECT c FROM Club c WHERE c.enabled = 1";
		clubs = em.createQuery(jpql, Club.class).getResultList();
		return clubs;
	}

	@Override
	public Club create(Club newClub, User user) {
		user = em.find(User.class, user.getId());
		if (user != null) {
			newClub.setUser(user);
			newClub.setEnabled(true);
			newClub.setShared(true);
			em.persist(newClub);
			ClubMember clubOwner = new ClubMember();
			ClubMemberId id = new ClubMemberId(user.getId(), newClub.getId());
			clubOwner.setId(id);
			clubOwner.setClub(newClub);
			clubOwner.setUser(user);
			clubOwner.setAdministrator(true);
			clubOwner.setNickname(user.getNickname());
			em.persist(clubOwner);
			List<ClubMember> members = new ArrayList<>();
			members.add(clubOwner);
			newClub.setClubMembers(members);
			return newClub;
		} 
		return null;
	}

	@Override
	public Club update(int id, Club updateClub) {
		Club dbClub = em.find(Club.class, id);
		if (dbClub != null) {
			dbClub.setName(updateClub.getName());
			dbClub.setPhotoUrl(updateClub.getPhotoUrl());
			dbClub.setDescription(updateClub.getDescription());
			dbClub.setShared(updateClub.isShared());

		}

		return dbClub;
	}

	@Override
	public boolean disable(int id) {
		Club dbClub = em.find(Club.class, id);
		dbClub.setEnabled(false);
		return true;
	}

	@Override
	public Club findById(int clubId) {
		return em.find(Club.class, clubId);
	}

	@Override
	public boolean enable(int id) {
		Club dbClub = em.find(Club.class, id);
		dbClub.setEnabled(true);
		return true;
	}

	@Override
	public boolean addMember(User user, Club club) {
		user = em.find(User.class, user.getId());
		club = em.find(Club.class, club.getId());
		if (user != null) {
			ClubMember member = new ClubMember();
			ClubMemberId id = new ClubMemberId(user.getId(), club.getId());
			member.setId(id);
			member.setClub(club);
			member.setUser(user);
			member.setAdministrator(true);
			member.setNickname(user.getNickname());
			em.persist(member);
			return true;
		}
		return false;
	}

}