package com.army.movieEro.main.dao;

import java.util.HashMap;
import java.util.List;

public interface MainDao {

	List<HashMap> selectNowPlayingList(String param);

	List<HashMap> selectBoardList(String param);
	
}
