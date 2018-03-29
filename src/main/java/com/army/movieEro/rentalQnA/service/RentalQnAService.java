package com.army.movieEro.rentalQnA.service;

import java.util.ArrayList;


import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

public interface RentalQnAService {
	
	public int getListCount();
	
	public ArrayList<RentalQnAVO> selectList(int currentPage, int limit);
	
	public RentalQnAVO selectBoard(int boardNum);
	
	public int insertBoard(RentalQnAVO b);
	
	public int updateBoard(RentalQnAVO b);
	
	public int deleteBoard(int boardNum);
	


	
}
