package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.EndangeredStatus;

public interface EndangeredStatusDAO {
	
	EndangeredStatus findById(int id);
	
	List<EndangeredStatus> findAll();

}
