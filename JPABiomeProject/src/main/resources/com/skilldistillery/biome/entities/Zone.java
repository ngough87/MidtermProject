package com.skilldistillery.biome.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Zone {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="average_low")
	private String averageLow;

	
	
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
		Zone other = (Zone) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		return "Zone [id=" + id + ", averageLow=" + averageLow + "]";
	}
	
	
}
