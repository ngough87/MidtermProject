package com.skilldistillery.biome.data;

import java.time.LocalDateTime;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Comment;
import com.skilldistillery.biome.entities.Plant;
import com.skilldistillery.biome.entities.Sighting;
import com.skilldistillery.biome.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {
		// TODO Auto-generated method stub
		return em.find(User.class, userId);

	}

	public List<User> findAll() {
		String jpql = "SELECT u FROM User u";
		return em.createQuery(jpql, User.class).getResultList();
	}

	@Override
	public User findByUsernameAndPassword(String username, String password) {
		User u = null;
		Map<Integer, User> users = new LinkedHashMap<>();
		int counter = 1;
		for (User user : findAll()) {
			users.put(counter, user);
			counter++;
		}
		Set<Integer> keys = users.keySet();
		for (Integer key : keys) {
			User user = users.get(key);
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}

	@Override
	public User createUser(User user) {

		user.setCreateDate(LocalDateTime.now());
		user.setEnabled(true);
		user.setHidden(false);

		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User updatePersonalInfo(int id, User user) {
		User updatedUser = em.find(User.class, id);
		if (updatedUser != null) {
			updatedUser.setFirstName(user.getFirstName());
			updatedUser.setLastName(user.getLastName());
			updatedUser.setEmail(user.getEmail());
			updatedUser.setProfileImage(user.getProfileImage());
			updatedUser.setAboutMe(user.getAboutMe());
			updatedUser.setHidden(user.getHidden());
			updatedUser.setUsername(user.getUsername());
			
			
			
		}
			
		return updatedUser;
	}

	@Override
	public boolean checkForDuplicateUsername(String username) {
		boolean result = false;
		
		for(User user : findAll()) {
			if (user.getUsername().equals(username)) {
				result = true;
			}
		}
		
		return result;
	}

	@Override
	public boolean deleteUser(int userId) {
		boolean deleted = false;
		
		User user = em.find(User.class, userId);
		
		if (user != null) {
			User dummy = new User();
			dummy.setId(0);
			
			if (user.getComments() != null) {
				while (user.getComments().size() > 0) {
					Comment comment = user.getComments().get(0);
					Comment dbComment = em.find(Comment.class, comment.getId());
										
					dbComment.setUser(dummy);
					user.removeComment(comment);
					em.persist(dbComment);
					em.remove(dbComment);
					em.persist(user);
					
				}
			}
			if (user.getSightings() != null) {
				while (user.getSightings().size() > 0) {
					Sighting sighting = user.getSightings().get(0);
					Sighting dbSighting = em.find(Sighting.class, sighting.getId());

					dbSighting.setUser(dummy);
					user.removeSighting(sighting);
					em.persist(dbSighting);
			
					em.persist(user);
				
				}
			}
			if (user.getFollowedUsers() != null) {
				while (user.getFollowedUsers().size() > 0) {
					User followedUser = user.getFollowedUsers().get(0);
					User dbFollowedUser = em.find(User.class, followedUser.getId());

					user.removeFollower(followedUser);
					em.persist(dbFollowedUser);
					em.persist(user);
					
				}
			}
			if (user.getPlants() != null) {
				while (user.getPlants().size() > 0) {
					Plant plant = user.getPlants().get(0);
					Plant dbPlant = em.find(Plant.class, plant.getId());

					dbPlant.setUser(dummy);
					user.removePlant(plant);
					em.persist(dbPlant);
				
					em.persist(user);
					
				}
			}
			
			em.remove(user);
			deleted = !em.contains(user);
		}
		return deleted;
	}

}
