package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private boolean enabled;
	
	private String role;
	
	@Column(name = "first_name")
	private String firstName;
	
	private String nickname;
	
	@Column(name = "photo_url")
	private String photoURL;
	
	private String description;
	
	private boolean shared;
	
	@Column(name = "last_name")
	private String lastName;
	

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	@OneToMany(mappedBy = "userId")
	private List<Ride> rides;
	
	@OneToMany(mappedBy = "userId")
	private List<Club> clubs;
	
	@OneToMany(mappedBy = "userId")
	private List<ClubComment> culbComments;
	
	@OneToMany(mappedBy = "userId")
	private List<RideComment> rideComments;
	
	@OneToMany(mappedBy = "userComment")
	private List<UserComment> userComments;
	
	@OneToMany(mappedBy = "recipientId")
	private List<UserComment> recipientComments;
	
	@OneToMany(mappedBy = "user")
	private List<RidePhoto> ridePhotos;
	
	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;
	
//	@OneToMany(mappedBy = "")
//	private List<Rider> riders;
	
//	@OneToMany(mappedBy = "")
//	private List<ClubMember> clubMembers;
	

	public User() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
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

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public List<Ride> getRides() {
		return rides;
	}

	public void setRides(List<Ride> rides) {
		this.rides = rides;
	}

	public List<Club> getClubs() {
		return clubs;
	}

	public void setClubs(List<Club> clubs) {
		this.clubs = clubs;
	}

	public List<ClubComment> getCulbComments() {
		return culbComments;
	}

	public void setCulbComments(List<ClubComment> culbComments) {
		this.culbComments = culbComments;
	}

	public List<RideComment> getRideComments() {
		return rideComments;
	}

	public void setRideComments(List<RideComment> rideComments) {
		this.rideComments = rideComments;
	}

	public List<UserComment> getUserComments() {
		return userComments;
	}

	public void setUserComments(List<UserComment> userComments) {
		this.userComments = userComments;
	}

	public List<UserComment> getRecipientComments() {
		return recipientComments;
	}

	public void setRecipientComments(List<UserComment> recipientComments) {
		this.recipientComments = recipientComments;
	}

	public List<RidePhoto> getRidePhotos() {
		return ridePhotos;
	}

	public void setRidePhotos(List<RidePhoto> ridePhotos) {
		this.ridePhotos = ridePhotos;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", nickname=" + nickname + ", photoURL=" + photoURL
				+ ", description=" + description + ", shared=" + shared + ", lastName=" + lastName + ", createDate="
				+ createDate + ", lastUpdate=" + lastUpdate + ", address=" + address + "]";
	}

	
}
