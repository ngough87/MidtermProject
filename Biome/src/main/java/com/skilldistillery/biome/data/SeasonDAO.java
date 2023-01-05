package com.skilldistillery.biome.data;

import com.skilldistillery.biome.entities.Season;

public interface SeasonDAO {
	Season findById(int id);
}
