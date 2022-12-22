package com.skilldistillery.biome.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Sighting {
	
	
	
	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="date_posted")
	private LocalDateTime datePosted;
	
	private String description;
	
	private String image;
	
	private Double latitude;
	
	private Double longitude;
	
	
	
	public Sighting() {
		super();
	
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public LocalDateTime getDatePosted() {
		return datePosted;
	}



	public void setDatePosted(LocalDateTime datePosted) {
		this.datePosted = datePosted;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getImage() {
		return image;
	}



	public void setImage(String image) {
		this.image = image;
	}



	public double getLatitude() {
		return latitude;
	}



	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}



	public double getLongitude() {
		return longitude;
	}



	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}



	@Override
	public String toString() {
		return "Sighting [id=" + id + ", datePosted=" + datePosted + ", description=" + description + ", image=" + image
				+ ", latitude=" + latitude + ", longitude=" + longitude + "]";
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
		Sighting other = (Sighting) obj;
		return id == other.id;
	}
	
	
	
	
	
}
