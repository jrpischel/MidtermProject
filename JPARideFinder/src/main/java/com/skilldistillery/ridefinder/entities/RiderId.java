package com.skilldistillery.ridefinder.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class RiderId implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "ride_id")
	private int rideId;

	public RiderId(int userId, int rideId) {
		this.userId = userId;
		this.rideId = rideId;
	}

	public RiderId() {
		
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRideId() {
		return rideId;
	}

	public void setRideId(int rideId) {
		this.rideId = rideId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RiderId [userId=" + userId + ", rideId=" + rideId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(rideId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RiderId other = (RiderId) obj;
		return rideId == other.rideId && userId == other.userId;
	}
	
	
}
