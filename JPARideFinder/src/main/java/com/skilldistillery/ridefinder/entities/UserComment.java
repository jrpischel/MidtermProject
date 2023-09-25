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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Table(name = "user_comment")
@Entity
public class UserComment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	@Column(name = "user_id")
//	private int userID;
//	
	private String comment;
	
	@Column(name = "picture_url")
	private String pictureURL;
	
	private boolean enabled;
	
	@Column(name = "create_date")
	@CreationTimestamp
	private LocalDateTime createDate;
	
	@ManyToOne
	@JoinColumn(name = "recipient_id")
	private User recipientId;
	
	private boolean shared;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "inreply_id")
	private UserComment userComment;
	
	@OneToMany(mappedBy = "userComment")
	private List<UserComment> userReplies;

	public UserComment() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public boolean isShared() {
		return shared;
	}

	public void setShared(boolean shared) {
		this.shared = shared;
	}

	public User getRecipientId() {
		return recipientId;
	}

	public void setRecipientId(User recipientId) {
		this.recipientId = recipientId;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserComment getUserComment() {
		return userComment;
	}

	public void setUserComment(UserComment userComment) {
		this.userComment = userComment;
	}

	public List<UserComment> getUserReplies() {
		return userReplies;
	}

	public void setUserReplies(List<UserComment> userReplies) {
		this.userReplies = userReplies;
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

	@Override
	public String toString() {
		return "UserComment [id=" + id + ", comment=" + comment + ", pictureURL=" + pictureURL + ", enabled=" + enabled
				+ ", createDate=" + createDate + ", recipientId=" + recipientId + ", shared=" + shared + ", userId="
				+ user + ", userComment=" + userComment + "]";
	}
	
	
}
