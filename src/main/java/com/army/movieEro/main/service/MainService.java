package com.army.movieEro.main.service;

import java.util.HashMap;
import java.util.List;

public interface MainService {

	List<HashMap> selectNowPlayingList(String param);

	List<HashMap> selectBoardList(String param);

}
