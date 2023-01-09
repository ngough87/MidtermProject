package com.skilldistillery.biome.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String username;

	private String password;

	private Boolean enabled;

	private String role;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	private String email;

	private Boolean hidden;

	@Column(name = "create_date")
	private LocalDateTime createDate;

	@Column(name = "about_me")
	private String aboutMe;

	@OneToOne
	@JoinColumn(name = "address_id")

	private Address address;

	@OneToOne
	@JoinColumn(name = "profile_image_id")
	private ProfileImage profileImage;

	@OneToMany(mappedBy = "user")
	private List<Plant> plants;
	
	
	@OneToMany
	@JoinTable(name = "followed_user", joinColumns = @JoinColumn(name = "user_id"), 
	inverseJoinColumns = @JoinColumn(name = "followed_user_id"))
	private List<User> followedUsers;
	
	
	
	@OneToMany(mappedBy = "user")
	private List<Comment> comments;
	
	
	@OneToMany(mappedBy = "user", fetch=FetchType.EAGER)
	private List<Sighting> sightings;
	
	
	
	
	
	public User() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getHidden() {
		return hidden;
	}

	public void setHidden(Boolean hidden) {
		this.hidden = hidden;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public ProfileImage getProfileImage() {
		return profileImage;
	}

	public void setProfileImage(ProfileImage profileImage) {
		this.profileImage = profileImage;
	}

	public void setPlant(List<Plant> plant) {
		this.plants = plant;
	}

	public List<Plant> getPlant() {
		return plants;
	}

	public List<Plant> getPlants() {
		return plants;
	}

	public void setPlants(List<Plant> plants) {
		this.plants = plants;
	}

	public List<User> getFollowedUsers() {
		return followedUsers;
	}

	public void setFollowedUsers(List<User> followedUsers) {
		this.followedUsers = followedUsers;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Sighting> getSightings() {
		return sightings;
	}

	public void setSightings(List<Sighting> sightings) {
		this.sightings = sightings;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
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
		User other = (User) obj;
		return id == other.id;
	}

	
	
	public void addPlant(Plant plant) {
		if (plant == null) {
			plants = new ArrayList<>();
		}
		if (!plants.contains(plant)) {
			plants.add(plant);
			plant.setUser(this);
		}
	}
	
	public void removePlant(Plant plant) {
		if (plants != null && plants.contains(plant)) {
			plants.remove(plant);
			plant.setUser(null);
		}
	}
	
	
	public void addFollower(User followedUser) {
		if (followedUser == null) {
			followedUsers = new ArrayList<>();
		}
		if (!followedUsers.contains(followedUser)) {
			followedUsers.add(followedUser);
			
		}
	}
	public void removeFollower(User followedUser) {
		if (followedUsers != null && followedUsers.contains(followedUser)) {
			followedUsers.remove(followedUser);
			followedUser.removeFollower(this);
		}
	}
	
	public void addComment(Comment comment) {
		if (comment == null) {
			comments = new ArrayList<>();
		}
		if (!comments.contains(comment)) {
			comments.add(comment);
			comment.setUser(this);
		}
	}
	
	public void removeComment(Comment comment) {
		if (comments != null && comments.contains(comment)) {
			comments.remove(comment);
			comment.setUser(null);
		}
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", hidden=" + hidden + ", createDate=" + createDate + ", aboutMe=" + aboutMe + "]";
	}

}
