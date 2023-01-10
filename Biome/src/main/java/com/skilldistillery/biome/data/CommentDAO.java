package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.Comment;
import com.skilldistillery.biome.entities.Sighting;
import com.skilldistillery.biome.entities.User;

public interface CommentDAO {
	
	Comment createComment(Comment comment, int sightingId, int userId);
	

}
