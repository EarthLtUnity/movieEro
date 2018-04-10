package com.army.movieEro.stCommunity.With_board.dao;

import java.util.ArrayList;

import com.army.movieEro.stCommunity.With_board.vo.WithBoard;

public interface WithBoardDao {
	
	public int getListCount();
	
	public ArrayList<WithBoard> selectList(int currentPage, int limit);
	
	public WithBoard selectBoard(int boardNum);
	
	public int insertBoard(WithBoard b);

	public ArrayList<WithBoard> selectListsub(int currentPage, int limit);

	
}
