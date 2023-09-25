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
	
	@Column(name = "last_name")
	private String lastName;
	
	private String nickname;
	
	@Column(name = "photo_url")
	private String photoURL;
	
	private String description;
	
	private boolean shared;
	
	

	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@Column(name = "last_update")
	@UpdateTimestamp
	private LocalDateTime lastUpdate;
	
	@OneToMany(mappedBy = "user")
	private List<Ride> rides;
	
	@OneToMany(mappedBy = "user")
	private List<Club> clubs;
	
	@OneToMany(mappedBy = "user")
	private List<ClubComment> clubComments;
	
	@OneToMany(mappedBy = "user")
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
	
	@OneToMany(mappedBy = "user")
	private List<Club> clubMembers;
	

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

	public void addRide(Ride ride) {
		if (rides == null) { rides = new ArrayList<>();}
		if( ! rides.contains(ride)) {
			rides.add(ride);
			if (ride.getUser() != null) {
				ride.getUser().removeRide(ride);
			}
			ride.setUser(null);
		}
	}
	
	public void removeRide(Ride ride) {
		if (rides != null && rides.contains(ride)) {
			rides.remove(ride);
			ride.setUser(null);
		}
	}


	public List<Club> getClubs() {
		return clubs;
	}

	public void setClubs(List<Club> clubs) {
		this.clubs = clubs;
	}

	public void addClub(Club club) {
		if (clubs == null) { clubs = new ArrayList<>();}
		if( ! clubs.contains(club)) {
			clubs.add(club);
			if (club.getUser() != null) {
				club.getUser().removeClub(club);
			}
			club.setUser(null);
		}
	}
	
	public void removeClub(Club club) {
		if (clubs != null && clubs.contains(club)) {
			clubs.remove(club);
			club.setUser(null);
		}
	}


	public List<ClubComment> getClubComments() {
		return clubComments;
	}

	public void setClubComments(List<ClubComment> clubComments) {
		this.clubComments = clubComments;
	}
	

	public void addClubComment(ClubComment comment) {
		if (clubComments == null) { clubComments = new ArrayList<>();}
		if( ! clubComments.contains(comment)) {
			clubComments.add(comment);
			if (comment.getUser() != null) {
				comment.getUser().removeClubComment(comment);
			}
			comment.setUser(null);
		}
	}
	
	public void removeClubComment(ClubComment comment) {
		if (clubComments != null && clubComments.contains(comment)) {
			clubComments.remove(comment);
			comment.setUser(null);
		}
	}


	public List<RideComment> getRideComments() {
		return rideComments;
	}

	public void setRideComments(List<RideComment> rideComments) {
		this.rideComments = rideComments;
	}
	

	public void addRideComment(RideComment rideComment) {
		if (rideComments == null) { rideComments = new ArrayList<>();}
		if( ! rideComments.contains(rideComment)) {
			rideComments.add(rideComment);
			if (rideComment.getUser() != null) {
				rideComment.getUser().removeRideComment(rideComment);
			}
			rideComment.setUser(null);
		}
	}
	
	public void removeRideComment(RideComment rideComment) {
		if (rideComments != null && rideComments.contains(rideComment)) {
			rideComments.remove(rideComment);
			rideComment.setUser(null);
		}
	}


	public List<UserComment> getUserComments() {
		return userComments;
	}

	public void setUserComments(List<UserComment> userComments) {
		this.userComments = userComments;
	}
	

	public void addUserComment(UserComment userComment) {
		if (userComments == null) { userComments = new ArrayList<>();}
		if( ! userComments.contains(userComment)) {
			userComments.add(userComment);
			if (userComment.getUser() != null) {
				userComment.getUser().removeUserComment(userComment);
			}
			userComment.setUser(null);
		}
	}
	
	public void removeUserComment(UserComment userComment) {
		if (userComments != null && userComments.contains(userComment)) {
			userComments.remove(userComment);
			userComment.setUser(null);
		}
	}


	public List<UserComment> getRecipientComments() {
		return recipientComments;
	}

	public void setRecipientComments(List<UserComment> recipientComments) {
		this.recipientComments = recipientComments;
	}

	public void addRecipientComment(UserComment recipientComment) {
		if (recipientComments == null) { recipientComments = new ArrayList<>();}
		if( ! recipientComments.contains(recipientComment)) {
			recipientComments.add(recipientComment);
			if (recipientComment.getUser() != null) {
				recipientComment.getUser().removeRecipientComment(recipientComment);
			}
			recipientComment.setUser(null);
		}
	}
	
	public void removeRecipientComment(UserComment recipientComment) {
		if (recipientComments != null && recipientComments.contains(recipientComment)) {
			recipientComments.remove(recipientComment);
			recipientComment.setUser(null);
		}
	}

	public List<RidePhoto> getRidePhotos() {
		return ridePhotos;
	}

	public void setRidePhotos(List<RidePhoto> ridePhotos) {
		this.ridePhotos = ridePhotos;
	}

	public void addRidePhoto(RidePhoto ridePhoto) {
		if (ridePhotos == null) { ridePhotos = new ArrayList<>();}
		if( ! ridePhotos.contains(ridePhoto)) {
			ridePhotos.add(ridePhoto);
			if (ridePhoto.getUser() != null) {
				ridePhoto.getUser().removeRidePhoto(ridePhoto);
			}
			ridePhoto.setUser(null);
		}
	}
	
	public void removeRidePhoto(RidePhoto ridePhoto) {
		if (ridePhotos != null && ridePhotos.contains(ridePhoto)) {
			ridePhotos.remove(ridePhoto);
			ridePhoto.setUser(null);
		}
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
