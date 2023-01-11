package com.skilldistillery.biome.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name ="comment_rating")
public class CommentRatingId implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "comment_id")
	private int commentId;

	public CommentRatingId() {
		super();
	}

	public CommentRatingId(int userId, int commentId) {
		super();
		this.userId = userId;
		this.commentId = commentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CommentRating [userId=" + userId + ", commentId=" + commentId + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(commentId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentRatingId other = (CommentRatingId) obj;
		return commentId == other.commentId && userId == other.userId;
	}
	
	
}
