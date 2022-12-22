package com.skilldistillery.biome.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name="sun_exposure")
public class SunExposure {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@ManyToMany
	@JoinTable(name = "plant_has_sun_exposure", joinColumns = @JoinColumn(name = "sun_exposure_id"), 
	inverseJoinColumns = @JoinColumn(name = "plant_id"))
	private List<Plant> plants;
	
	public SunExposure() { }



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public List<Plant> getPlants() {
		return plants;
	}



	public void setPlants(List<Plant> plants) {
		this.plants = plants;
	}

	public void addPlant(Plant plant) {
		if (plant == null) {
			plants = new ArrayList<>();
		}
		if (!plants.contains(plant)) {
			plants.add(plant);
			plant.addExposure(this);
		}
	}
	
	public void removePlant(Plant plant) {
		if (plants != null && plants.contains(plant)) {
			plants.remove(plant);
			plant.removeSunExposure(this);
		}
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
		SunExposure other = (SunExposure) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		return "SunExposure [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	
	
	
	
	
}
