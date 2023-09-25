package com.skilldistillery.ridefinder.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class ClubMemberId implements Serializable{

	private static final long serialVersionID = 1L;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "club_id")
	private int clubId;

	public ClubMemberId() {
		
	}
	
	public ClubMemberId(int userId, int clubId) {
		this.userId = userId;
		this.clubId = clubId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public static long getSerialversionid() {
		return serialVersionID;
	}

	@Override
	public String toString() {
		return "ClubMemberId [userId=" + userId + ", clubId=" + clubId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(clubId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ClubMemberId other = (ClubMemberId) obj;
		return clubId == other.clubId && userId == other.userId;
	}
	
	
}
