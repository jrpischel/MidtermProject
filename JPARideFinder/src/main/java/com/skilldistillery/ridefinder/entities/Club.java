package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Club {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	private String name;

	@Column(name = "photo_url")
	private String photoUrl;

	private boolean enabled;

	private String description;

	private boolean shared;

	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;

	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	@OneToMany(mappedBy = "club")
	private List<Ride> rides;
	
	@OneToMany(mappedBy = "club")
	private List<ClubMember> clubMembers;

	public Club() {
	}

	

	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public LocalDateTime getLastUpdate() {
		return lastUpdate;
	}

	public void setLastUpdate(LocalDateTime lastUpdate) {
		this.lastUpdate = lastUpdate;
	}



	public List<ClubMember> getClubMembers() {
		return clubMembers;
	}

	public void setClubMembers(List<ClubMember> clubMembers) {
		this.clubMembers = clubMembers;
	}

	public List<Ride> getRides() {
		return rides;
	}



	public void setRides(List<Ride> rides) {
		this.rides = rides;
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	public void addClubMember(ClubMember clubMember) {
		if (clubMembers == null) { clubMembers = new ArrayList<>();}
		if( ! clubMembers.contains(clubMember)) {
			clubMembers.add(clubMember);
			if (clubMember.getClub() != null) {
				clubMember.getClub().removeClubMember(clubMember);
			}
			clubMember.setClub(null);
		}
	}
	
	public void removeClubMember(ClubMember clubMember) {
		if (clubMembers != null && clubMembers.contains(clubMember)) {
			clubMembers.remove(clubMember);
			clubMember.setClub(null);
		}
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Club other = (Club) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Club " + "\n User: " + user + "\n Name:" + name + "\n Club Active: "
				+ enabled + "\n Description: " + description + "\n Club Created On: " + createDate;
	}

}
