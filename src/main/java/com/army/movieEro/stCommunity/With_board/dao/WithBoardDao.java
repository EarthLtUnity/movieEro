package com.army.movieEro.stCommunity.With_board.dao;

import java.util.ArrayList;

import com.army.movieEro.stCommunity.With_board.vo.WithBoard;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard_sub;

public interface WithBoardDao {
	// 리스트 갯수 가져오기
	public int getListCount();
	
	// 메인 Table 전체 출력
	public ArrayList<WithBoard> selectList(int currentPage, int limit);
	
	// 서브 Table 전체 출력
	public ArrayList<WithBoard_sub> selectListsub(int currentPage, int limit);
	
	// 게시판 추가
	public int insertBoard(WithBoard b);

	// 결제 & 참여
	public int withReserve(WithBoard_sub wSub);

	/*Search*/
	
	// searchListCount
	public int getListCountSearch(String keyword);
	
	// searchList
	public ArrayList<WithBoard> searchList(int currentPage, int limit, String word);

	public int writerPhoneNumber(String writerId);

	
	
}
