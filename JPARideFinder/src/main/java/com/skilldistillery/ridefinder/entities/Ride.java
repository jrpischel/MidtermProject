package com.skilldistillery.ridefinder.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
	@Column(name = "start_date")
	private LocalDate startDate;

	private String duration;
	@Column(name = "club_id")
	private int clubId;
	@OneToOne
	@Column(name = "start_address_id")
	private int startAddressId;
	@Column(name = "end_address_id")
	private int endAddressId;
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	@UpdateTimestamp
	@Column(name = "last_update")
	private LocalDateTime lastUpdate;

	private String description;
	@Column(name = "banner_url")
	private String bannerURL;
	@Column(name = "skill_level_id")
	private int skillLevelId;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private int userId;
	@Column(name = "photo_url")
	private String photoURL;
	
	

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

	public LocalDate getStartDate() {
		return startDate;
	}

	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getClubId() {
		return clubId;
	}

	public void setClubId(int clubId) {
		this.clubId = clubId;
	}

	public int getStartAddressId() {
		return startAddressId;
	}

	public void setStartAddressId(int startAddressId) {
		this.startAddressId = startAddressId;
	}

	public int getEndAddressId() {
		return endAddressId;
	}

	public void setEndAddressId(int endAddressId) {
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

	public int getSkillLevelId() {
		return skillLevelId;
	}

	public void setSkillLevelId(int skillLevelId) {
		this.skillLevelId = skillLevelId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
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
		StringBuilder builder = new StringBuilder();
		builder.append("Ride [id=").append(id).append(", name=").append(name).append(", startTime=").append(startTime)
				.append(", startDate=").append(startDate).append(", duration=").append(duration).append(", clubId=")
				.append(clubId).append(", startAddressId=").append(startAddressId).append(", endAddressId=")
				.append(endAddressId).append(", createDate=").append(createDate).append(", lastUpdate=")
				.append(lastUpdate).append(", description=").append(description).append(", bannerURL=")
				.append(bannerURL).append(", skillLevelId=").append(skillLevelId).append(", userId=").append(userId)
				.append(", photoURL=").append(photoURL).append("]");
		return builder.toString();
	}

}
