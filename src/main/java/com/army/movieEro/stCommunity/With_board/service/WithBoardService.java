package com.army.movieEro.stCommunity.With_board.service;

import java.util.ArrayList;

import com.army.movieEro.stCommunity.With_board.vo.WithBoard;


public interface WithBoardService {
	
	public int getListCount();
	
	public ArrayList<WithBoard> selectList(int currentPage, int limit);
	
	public WithBoard selectBoard(int boardNum);
	
	public int insertBoard(WithBoard b);

	public void addReadCount(int boardNum);
	

}
