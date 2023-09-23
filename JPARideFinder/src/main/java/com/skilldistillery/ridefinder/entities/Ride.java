package com.skilldistillery.ridefinder.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;


@Entity
public class Ride {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;
	@Column(name = "start_time")
	private LocalTime startTime;
	
	@Column(name = "ride_date")
	private LocalDate rideDate;

	private String duration;



	@ManyToOne
	@JoinColumn(name = "club_id")
	private Club clubId;


	@OneToOne
	@JoinColumn(name = "start_address_id")
	private Address startAddressId;
	
	@OneToOne
	@JoinColumn(name = "end_address_id")
	private Address endAddressId;

	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	private String description;
	@Column(name = "banner_url")
	private String bannerURL;
	
	@ManyToOne
	@JoinColumn(name = "skill_level_id")
	private SkillLevel skillLevelId;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User userId;
	@Column(name = "photo_url")
	private String photoURL;
	@OneToMany(mappedBy="rideId")
	private List<RideComment> rideComments;
	

	
	

	public Ride() {
		super();
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

	public LocalTime getStartTime() {
		return startTime;
	}

	public void setStartTime(LocalTime startTime) {
		this.startTime = startTime;
	}

	

	public LocalDate getRideDate() {
		return rideDate;
	}

	public void setRideDate(LocalDate rideDate) {
		this.rideDate = rideDate;
	}

	public List<RideComment> getRideComments() {
		return rideComments;
	}

	public void setRideComments(List<RideComment> rideComments) {
		this.rideComments = rideComments;
	}


	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public Club getClubId() {
		return clubId;
	}

	public void setClubId(Club clubId) {
		this.clubId = clubId;
	}

	public Address getStartAddressId() {
		return startAddressId;
	}

	public void setStartAddressId(Address startAddressId) {
		this.startAddressId = startAddressId;
	}

	public Address getEndAddressId() {
		return endAddressId;
	}

	public void setEndAddressId(Address endAddressId) {
		this.endAddressId = endAddressId;
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

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getBannerURL() {
		return bannerURL;
	}

	public void setBannerURL(String bannerURL) {
		this.bannerURL = bannerURL;
	}

	public SkillLevel getSkillLevelId() {
		return skillLevelId;
	}

	public void setSkillLevelId(SkillLevel skillLevelId) {
		this.skillLevelId = skillLevelId;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Ride other = (Ride) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Ride [id=" + id + ", name=" + name + ", startTime=" + startTime + ", rideDate=" + rideDate
				+ ", duration=" + duration + ", clubId=" + clubId + ", startAddressId=" + startAddressId
				+ ", endAddressId=" + endAddressId + ", createDate=" + createDate + ", lastUpdate=" + lastUpdate
				+ ", description=" + description + ", bannerURL=" + bannerURL + ", skillLevelId=" + skillLevelId
				+ ", userId=" + userId + ", photoURL=" + photoURL + "]";
	}

	




}
