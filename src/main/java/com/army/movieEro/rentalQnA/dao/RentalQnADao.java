package com.army.movieEro.rentalQnA.dao;

import java.util.ArrayList;

import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

public interface RentalQnADao {

	public int getListCount(String point);
	
	public ArrayList<RentalQnAVO> selectList(int currentPage, int limit);
	
	public RentalQnAVO selectBoard(int boardNum);
	
	public int insertBoard(RentalQnAVO b);
	
	public int updateBoard(RentalQnAVO b);
	
	public int deleteBoard(int boardNum);
	
	public int getListCount();
	
	public ArrayList<RentalQnAVO> selectList(int currentPage, String point ,int limit);
	
	
}
