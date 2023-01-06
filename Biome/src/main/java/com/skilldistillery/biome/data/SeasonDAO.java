package com.skilldistillery.biome.data;

import java.util.List;

import com.skilldistillery.biome.entities.Season;

public interface SeasonDAO {
	Season findById(int id);
	List<Season> findAll();
}
