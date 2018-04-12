package com.army.movieEro.jkNoticeBoard.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.jkNoticeBoard.dao.reserveDao;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;


@Service("REService")
public class reserveServiceImpl implements reserveService{

	
	@Autowired
	reserveDao REDao;
	
	@Override
	public int reserveInsert(HashMap<String, String> map) {
		return REDao.reserveInsert(map);
	}

	@Override
	public int reserveModify(String CINEMA_RESERVE_NO) {
		return REDao.reserveModify(CINEMA_RESERVE_NO);
		
	}
	
}
