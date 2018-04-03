package com.army.movieEro.rentalQnA.service;

import java.util.ArrayList;

import com.army.movieEro.rentalQnA.vo.RentalQnAReplyVO;

public interface RentalQnAReplyService {

	public ArrayList<RentalQnAReplyVO> selectList(int bnum);
	
	public int insertBoard(RentalQnAReplyVO b);
	
	public int updateBoard(RentalQnAReplyVO b);
	
	public int deleteBoard(int boardNum);
	
	public int getListCount(int boardNum);
	
	public RentalQnAReplyVO selectViewList(int bno); 
}
