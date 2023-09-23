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

@Entity
@Table(name = "club_comment")
public class ClubComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private int userId;
	
	private String comment;
	
	@Column(name = "picture_url")
	private String pictureUrl;
	
	private boolean enabled;
	
	@CreationTimestamp
	@Column(name = "create_date")
	private LocalDateTime createDate;
	
	@Column(name = "inreply_id")
	private Integer inreplyId;

	@ManyToOne
	@JoinColumn(name = "club_id")
	private int clubId;
	
	@OneToMany(mappedBy = "clubId")
	private List<ClubComment> clubComments;
	
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

