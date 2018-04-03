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
		return rentalQnAReplyDaoImpl.insertBoard(b);
	}

	@Override
	public int updateBoard(RentalQnAReplyVO b) {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.updateBoard(b);
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.deleteBoard(boardNum);
	}
	public int getListCount(int boardNum) {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.getListCount(boardNum);
	}
	@Override
	public RentalQnAReplyVO selectViewList(int bno) {
		// TODO Auto-generated method stub
		return rentalQnAReplyDaoImpl.selectViewList(bno);
		}

}
