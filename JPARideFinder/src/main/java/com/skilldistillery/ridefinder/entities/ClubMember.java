package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "club_member")
public class ClubMember {

	@EmbeddedId
	private ClubMemberId id;

	private Boolean administrator;

	@Column(name = "date_joined")
	@CreationTimestamp
	private LocalDateTime dateJoined;

	private String nickname;

	@ManyToOne
	@JoinColumn(name = "user_id")
	@MapsId(value = "userId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "club_id")
	@MapsId(value = "clubId")
	private Club club;

	public ClubMember() {

	}

	public ClubMemberId getId() {
		return id;
	}

	public void setId(ClubMemberId id) {
		this.id = id;
	}

	public Boolean getAdministrator() {
		return administrator;
	}

	public void setAdministrator(Boolean administrator) {
		this.administrator = administrator;
	}

	public LocalDateTime getDateJoined() {
		return dateJoined;
	}

	public void setDateJoined(LocalDateTime dateJoined) {
		this.dateJoined = dateJoined;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Club getClub() {
		return club;
	}

	public void setClub(Club club) {
		this.club = club;
	}

	@Override
	public String toString() {
		return "ClubMember [id=" + id + ", administrator=" + administrator + ", dateJoined=" + dateJoined
				+ ", nickname=" + nickname + "]";
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
		ClubMember other = (ClubMember) obj;
		return Objects.equals(id, other.id);
	}

	

}
