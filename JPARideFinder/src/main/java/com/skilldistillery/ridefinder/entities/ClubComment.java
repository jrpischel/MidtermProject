package com.skilldistillery.ridefinder.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "club_comment")
public class ClubComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	TODO foreign key
//	@Column(name = "user_id")
//	private int userId;
	
	private String comment;
	
	@Column(name = "picture_url")
	private String pictureUrl;
	
	private boolean enabled;
	
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "inreply_id")
	private Integer inreplyId;

//	TODO foreign key
//	@Column(name = "club_id")
//	private int clubId;
	
	
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

	public String getPictureUrl() {
		return pictureUrl;
	}

	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
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

	public Integer getInreplyId() {
		return inreplyId;
	}

	public void setInreplyId(Integer inreplyId) {
		this.inreplyId = inreplyId;
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
		ClubComment other = (ClubComment) obj;
		return id == other.id;
	}

	
	@Override
	public String toString() {
		return "ClubContent [id=" + id + ", comment=" + comment + ", pictureUrl=" + pictureUrl + ", enabled=" + enabled
				+ ", createDate=" + createDate + ", inreplyId=" + inreplyId + "]";
	}  
	
	
}

