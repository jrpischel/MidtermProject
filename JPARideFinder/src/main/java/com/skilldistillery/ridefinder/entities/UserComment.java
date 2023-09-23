package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Table(name = "user_comment")
@Entity
public class UserComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userID;
	
	private String comment;
	
	@Column(name = "picture_url")
	private String pictureURL;
	
	private boolean enabled;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@Column(name = "inreply_id")
	private int inreplyID;
	
	@Column(name = "recipient_id")
	private int recipientID;
	
	private boolean shared;

	public UserComment() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getPictureURL() {
		return pictureURL;
	}

	public void setPictureURL(String pictureURL) {
		this.pictureURL = pictureURL;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public int getInreplyID() {
		return inreplyID;
	}

	public void setInreplyID(int inreplyID) {
		this.inreplyID = inreplyID;
	}

	public int getRecipientID() {
		return recipientID;
	}

	public void setRecipientID(int recipientID) {
		this.recipientID = recipientID;
	}

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	@Override
	public String toString() {
		return "UserComment [id=" + id + ", userID=" + userID + ", comment=" + comment + ", pictureURL=" + pictureURL
				+ ", enabled=" + enabled + ", createDate=" + createDate + ", inreplyID=" + inreplyID + ", recipientID="
				+ recipientID + ", shared=" + shared + "]";
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
		UserComment other = (UserComment) obj;
		return id == other.id;
	}
	
	
}