package com.army.movieEro.jkNoticeBoard.dao;

import java.util.ArrayList;

import com.army.movieEro.jkNoticeBoard.vo.noticeVO;


public interface noticeDao {

	public int insertNoticeBoard(noticeVO noticeVO);

	public ArrayList<noticeVO> selectListAdmin(int currentPage, int limit);
		
	public noticeVO selectNoticeBoard(int NOTICE_BOARD_NO);

	public int getListCount();

	public int addReadCount(int NOTICE_BOARD_NO);

	public noticeVO selectBoardDetail(int NOTICE_BOARD_NO);


}
