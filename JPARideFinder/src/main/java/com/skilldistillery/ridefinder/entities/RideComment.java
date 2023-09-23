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

@Entity
@Table(name = "ride_comment")
public class RideComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "ride_id")
	private Ride rideId;
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User userId;

	private String comment;

	@Column(name = "picture_url")
	private String pictureURL;

	private boolean enabled;

	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "inreply_id")
	private int replyId;

	public RideComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Ride getRideId() {
		return rideId;
	}

	public void setRideId(Ride rideId) {
		this.rideId = rideId;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
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

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
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
		RideComment other = (RideComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RideComment [id=").append(id).append(", rideId=").append(rideId).append(", userId=")
				.append(userId).append(", comment=").append(comment).append(", pictureURL=").append(pictureURL)
				.append(", enabled=").append(enabled).append(", createDate=").append(createDate).append(", replyId=")
				.append(replyId).append("]");
		return builder.toString();
	}

}
