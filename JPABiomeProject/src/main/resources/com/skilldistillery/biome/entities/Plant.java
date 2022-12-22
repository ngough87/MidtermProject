package com.skilldistillery.biome.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Plant {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@Column(name="common_name")
	private String commonName;
	
	
	@Column(name="scientific_name")
	private String scientificName;
	
	@Column(name="last_updated")
	private LocalDateTime lastUpdated;
	
	@Column(name="environmental_notes")
	private String environmentalNotes;
	
	private Boolean edible;
	
	@Column(name="medicinal_properties")
	private String medicinalProperties;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@Column(name="create_date")
	private LocalDateTime create_date;
	
	private String description;

	public Plant() {
		super();
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public String getCommonName() {
		return commonName;
	}

	public void setCommonName(String commonName) {
		this.commonName = commonName;
	}

	public String getScientificName() {
		return scientificName;
	}

	public void setScientificName(String scientificName) {
		this.scientificName = scientificName;
	}

	public LocalDateTime getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(LocalDateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public String getEnvironmentalNotes() {
		return environmentalNotes;
	}

	public void setEnvironmentalNotes(String environmentalNotes) {
		this.environmentalNotes = environmentalNotes;
	}

	public Boolean getEdible() {
		return edible;
	}

	public void setEdible(Boolean edible) {
		this.edible = edible;
	}

	public String getMedicinalProperties() {
		return medicinalProperties;
	}

	public void setMedicinalProperties(String medicinalProperties) {
		this.medicinalProperties = medicinalProperties;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalDateTime getCreate_date() {
		return create_date;
	}

	public void setCreate_date(LocalDateTime create_date) {
		this.create_date = create_date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Override
	public int hashCode() {
		return Objects.hash(Id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Plant other = (Plant) obj;
		return Id == other.Id;
	}

	@Override
	public String toString() {
		return "Plant [Id=" + Id + ", commonName=" + commonName + ", scientificName=" + scientificName
				+ ", lastUpdated=" + lastUpdated + ", environmentalNotes=" + environmentalNotes + ", edible=" + edible
				+ ", medicinalProperties=" + medicinalProperties + ", imageUrl=" + imageUrl + ", create_date="
				+ create_date + ", description=" + description + "]";
	}

}
