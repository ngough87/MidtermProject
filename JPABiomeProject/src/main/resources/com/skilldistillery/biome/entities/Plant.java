package com.skilldistillery.biome.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;


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
	
	
	@ManyToOne
	@JoinColumn(name="habitat_id")
	private Habitat habitat;
	
	@ManyToOne
	@JoinColumn(name="endangered_status_id")
	private EndangeredStatus endangeredStatus;
	
	@ManyToOne
	@JoinColumn(name="plant_type_id")
	private PlantType plantType;
	
	@ManyToOne
	@JoinColumn(name="season_id")
	private Season season;
	
	@ManyToMany(mappedBy="plants")
	@Cascade({ CascadeType.SAVE_UPDATE, CascadeType.MERGE, CascadeType.PERSIST})
	private List<Zone> zones;
	
	@ManyToMany(mappedBy="plants")
	@Cascade({ CascadeType.SAVE_UPDATE, CascadeType.MERGE, CascadeType.PERSIST})
	private List<SunExposure> sunExposures;
	
	@ManyToOne
	@JoinColumn(name = "created_by_id")
	private User user;
	
	@OneToMany(mappedBy = "plant")
	private List<Sighting> sightings;
	

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

	public Habitat getHabitat() {
		return habitat;
	}

	public void setHabitat(Habitat habitat) {
		this.habitat = habitat;
	}

	public EndangeredStatus getEndangeredStatus() {
		return endangeredStatus;
	}

	public void setEndangeredStatus(EndangeredStatus endangeredStatus) {
		this.endangeredStatus = endangeredStatus;
	}

	public PlantType getPlantType() {
		return plantType;
	}

	public void setPlantType(PlantType plantType) {
		this.plantType = plantType;
	}

	public Season getSeason() {
		return season;
	}

	public void setSeason(Season season) {
		this.season = season;
	}

	public List<Zone> getZones() {
		return zones;
	}

	public void setZones(List<Zone> zones) {
		this.zones = zones;
	}

	public List<SunExposure> getSunExposure() {
		return sunExposures;
	}

	public void setSunExposure(List<SunExposure> sunExposure) {
		this.sunExposures = sunExposure;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}

	@Override
	public int hashCode() {
		return Objects.hash(Id);
	}
	
	public void addZone(Zone zone) {
		if (zones == null) {
			zones = new ArrayList<>();
		}
		if (!zones.contains(zone)) {
			zones.add(zone);
			zone.addPlant(this);
		}
	}
	
	public void removeZone(Zone zone) {
		if (zones != null && zones.contains(zone)) {
			zones.remove(zone);
			zone.removePlant(this);
		}
	}
	
	public void addExposure(SunExposure sunExposure) {
		if (sunExposures == null) {
			sunExposures = new ArrayList<>();
		}
		if (!sunExposures.contains(sunExposure)) {
			sunExposures.add(sunExposure);
			sunExposure.addPlant(this);
		}
	}
	
	public void removeSunExposure(SunExposure sunExposure) {
		if (sunExposures != null && sunExposures.contains(sunExposure)) {
			sunExposures.remove(sunExposure);
			sunExposure.removePlant(this);
		}
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
