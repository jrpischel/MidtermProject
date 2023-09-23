package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "ride_photo")
public class RidePhoto {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "photo_url")
	private String photoURL;

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;

	
	private String caption;

	@ManyToOne
	@JoinColumn(name = "ride_id")
	private Ride ride;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	private boolean enabled;

	public RidePhoto() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

	public Ride getRide() {
		return ride;
	}

	public void setRide(Ride ride) {
		this.ride = ride;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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
		RidePhoto other = (RidePhoto) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "RidePhoto [id=" + id + ", photoURL=" + photoURL + ", createDate=" + createDate + ", caption=" + caption
				+ ", ride=" + ride + ", user=" + user + ", enabled=" + enabled + "]";
	}

}
