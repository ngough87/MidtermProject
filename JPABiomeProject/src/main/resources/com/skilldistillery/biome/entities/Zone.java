package com.skilldistillery.biome.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@Entity
public class Zone {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="average_low")
	private String averageLow;
	
	@ManyToMany

	@JoinTable(name = "plant_has_zone", joinColumns = @JoinColumn(name = "zone_id"), 
	inverseJoinColumns = @JoinColumn(name = "plant_id"))
	private List<Plant> plants;
	
	
	
	public Zone() { }



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getAverageLow() {
		return averageLow;
	}



	public void setAverageLow(String averageLow) {
		this.averageLow = averageLow;
	}



	public List<Plant> getPlants() {
		return plants;
	}



	public void setPlants(List<Plant> plants) {
		this.plants = plants;
	}



	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	public void addPlant(Plant plant) {
		if (plant == null) {
			plants = new ArrayList<>();
		}
		if (!plants.contains(plant)) {
			plants.add(plant);
			plant.addZone(this);
		}
	}
	
	public void removePlant(Plant plant) {
		if (plants != null && plants.contains(plant)) {
			plants.remove(plant);
			plant.removeZone(this);
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
		Zone other = (Zone) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		return "" + id;
	}
	
	
}
