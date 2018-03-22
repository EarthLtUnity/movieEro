package com.army.movieEro.rentalQnA.dao;

import java.util.ArrayList;

import com.army.movieEro.rentalQnA.vo.RentalQnAReplyVO;

public interface RentalQnAReplyDao {
	public ArrayList<RentalQnAReplyVO> selectList(int currentPage, int limit);
	
	public int insertBoard(RentalQnAReplyVO b);
	
	public int updateBoard(RentalQnAReplyVO b);
	
	public int deleteBoard(int boardNum);
}
