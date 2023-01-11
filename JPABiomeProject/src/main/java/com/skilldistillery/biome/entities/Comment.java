package com.skilldistillery.biome.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String contents;
	
	@Column(name= "in_reply_to")
	private Integer inReplyTo;
	
	@Column(name= "date_posted")
	private LocalDateTime datePosted;
	
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	
	@ManyToOne
	@JoinColumn(name = "sighting_id")
	private Sighting sighting;

	public Comment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getInReplyTo() {
		return inReplyTo;
	}

	public void setInReplyTo(int inReplyTo) {
		this.inReplyTo = inReplyTo;
	}

	public LocalDateTime getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(LocalDateTime datePosted) {
		this.datePosted = datePosted;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Sighting getSighting() {
		return sighting;
	}

	public void setSighting(Sighting sighting) {
		this.sighting = sighting;
	}

	@Override
	public String toString() {
		return "Commented : " + contents + " on " +  datePosted.getDayOfMonth() + " " + datePosted.getMonth() + " on " + inReplyTo + "." + "\n";
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
		Comment other = (Comment) obj;
		return id == other.id;
	}

	
}
