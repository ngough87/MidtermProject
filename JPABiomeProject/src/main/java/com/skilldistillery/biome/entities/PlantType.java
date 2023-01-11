package com.skilldistillery.biome.entities;

import java.util.List;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="plant_type")
public class PlantType {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String description;
	
	@OneToMany(mappedBy="plantType")
	private List<Plant> plants;
	
	public PlantType() { }



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
		PlantType other = (PlantType) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		return "PlantType [id=" + id + ", name=" + name + ", description=" + description + "]";
	}
	
	
	
	
	
}
