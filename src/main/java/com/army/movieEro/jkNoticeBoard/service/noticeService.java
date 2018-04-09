package com.army.movieEro.jkNoticeBoard.service;

import java.util.ArrayList;

import com.army.movieEro.jkNoticeBoard.vo.noticeVO;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;


public interface noticeService {
	public int insertNoticeBoard(noticeVO noticeVO); 
	
	public ArrayList<noticeVO> selectListAdmin(int currentPage, int limit);
	
	public noticeVO selectNoticeBoard(int NOTICE_BOARD_NO);

	public int getListCount();

	public void addReadCount(int NOTICE_BOARD_NO);

	public noticeVO selectBoardDetail(int NOTICE_BOARD_NO);

	public int modifyNoticeBoard(noticeVO noticeVO);

	public int deleteNoticeBoard(int NOTICE_BOARD_NO);

	public ArrayList<noticeVO> selectListUser(int currentPage, int limit);





}
