package com.skilldistillery.biome.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Comment;
import com.skilldistillery.biome.entities.Sighting;
import com.skilldistillery.biome.entities.User;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {

	@PersistenceContext
	private EntityManager em;

	public Comment createComment(Comment comment, int sightingId, int userId) {

		comment.setDatePosted(LocalDateTime.now());

		Sighting sighting = em.find(Sighting.class, sightingId);

		User user = em.find(User.class, userId);

		comment.setUser(user);
		sighting.addComment(comment);

		em.persist(comment);
		em.flush();
		return comment;
	}

}
