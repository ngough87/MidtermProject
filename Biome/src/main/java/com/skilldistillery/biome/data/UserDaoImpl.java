package com.skilldistillery.biome.data;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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

		user.setEnabled(true);
		user.setHidden(false);

		em.persist(user);
		em.flush();
		return user;
	}

}
