package com.army.movieEro.rentalQnA.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.rentalQnA.dao.RentalQnAReplyDao;
import com.army.movieEro.rentalQnA.vo.RentalQnAReplyVO;

@Service("rentalQnAReplyServiceImpl")
public class RentalQnAReplyServiceImpl implements RentalQnAReplyService {

	@Autowired 
	private RentalQnAReplyDao rentalQnAReplyDaoImpl;
	@Override
	public ArrayList<RentalQnAReplyVO> selectList(int bnum) {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.selectList(bnum);
	}

	@Override
	public int insertBoard(RentalQnAReplyVO b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateBoard(RentalQnAReplyVO b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return 0;
	}
	public int getListCount() {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.getListCount();
	}

}
