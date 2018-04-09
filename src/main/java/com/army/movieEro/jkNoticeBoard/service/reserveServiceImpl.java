package com.army.movieEro.jkNoticeBoard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.jkNoticeBoard.dao.reserveDao;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;


@Service("REService")
public class reserveServiceImpl implements reserveService{

	
	@Autowired
	reserveDao REDao;
	
	@Override
	public int reserveInsert(paymentVO paymentVO) {
		return REDao.reserveInsert(paymentVO);
	}
	
}
