package com.skilldistillery.biome.data;

import java.time.LocalDateTime;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.biome.entities.Comment;

@Service
@Transactional
public class CommentDAOImpl implements CommentDAO {
	
	
	@PersistenceContext
	private EntityManager em;

	public Comment createComment(Comment comment) {
		
		comment.setDatePosted(LocalDateTime.now());
		
		em.persist(comment);
		em.flush();
		return comment;
	}

	
	
	
}
