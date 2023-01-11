package com.skilldistillery.biome.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name ="comment_rating")
public class CommentRating {

		@EmbeddedId
		private CommentRatingId id;
		
		private int value;
		
		@Column(name = "rating_reason")
		private String ratingReason;

		public CommentRating() {
			super();
		}

		public CommentRatingId getId() {
			return id;
		}

		public void setId(CommentRatingId id) {
			this.id = id;
		}

		public int getValue() {
			return value;
		}

		public void setValue(int value) {
			this.value = value;
		}

		public String getRatingReason() {
			return ratingReason;
		}

		public void setRatingReason(String ratingReason) {
			this.ratingReason = ratingReason;
		}

		@Override
		public String toString() {
			return "CommentRating [id=" + id + ", value=" + value + ", ratingReason=" + ratingReason + "]";
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
			CommentRating other = (CommentRating) obj;
			return Objects.equals(id, other.id);
		}

}
