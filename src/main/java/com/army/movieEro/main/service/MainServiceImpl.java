package com.army.movieEro.main.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.army.movieEro.main.dao.MainDao;


@Service("mainService")
public class MainServiceImpl implements MainService {
	@Resource(name="mainDao")
	private MainDao mainDao;
	
	@Override
	public List<HashMap> selectNowPlayingList(String param) {
		return mainDao.selectNowPlayingList(param);
	}
	
	@Override
	public List<HashMap> selectBoardList(String param) {
		return mainDao.selectBoardList(param);
	}

}
