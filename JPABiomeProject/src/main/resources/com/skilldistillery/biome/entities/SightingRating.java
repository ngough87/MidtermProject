package com.skilldistillery.biome.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="sighting_rating")
public class SightingRating {

	
	@EmbeddedId
	private SightingRatingId id;
	
	private int value;
	
	@Column(name="rating_reason")
	private String ratingReason;

	
	
	
	
	public SightingRating() {
		super();
		// TODO Auto-generated constructor stub
	}





	public SightingRatingId getId() {
		return id;
	}





	public void setId(SightingRatingId id) {
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
		return "SightingRating [id=" + id + ", value=" + value + ", ratingReason=" + ratingReason + "]";
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
		SightingRating other = (SightingRating) obj;
		return Objects.equals(id, other.id);
	}

	
	
	
	
}
