package com.army.movieEro.rentalQnA.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.rentalQnA.dao.RentalQnADao;
import com.army.movieEro.rentalQnA.dao.RentalQnADaoImpl;
import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

@Service("rentalQnAServiceImpl")
public class RentalQnAServiceImpl implements RentalQnAService {

@Autowired
	private RentalQnADao rentalQnADaoImpl;

	@Override
	public ArrayList<RentalQnAVO> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.selectList(currentPage, limit);
	}

	@Override
	public RentalQnAVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.selectBoard(boardNum);
	}

	@Override
	public int insertBoard(RentalQnAVO b) {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.insertBoard(b);
	}

	@Override
	public int updateBoard(RentalQnAVO b) {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.updateBoard(b);
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.deleteBoard(boardNum);
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return rentalQnADaoImpl.getListCount();
	}





}
