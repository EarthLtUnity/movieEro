package com.army.movieEro.jkNoticeBoard.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.jkNoticeBoard.dao.noticeDao;
import com.army.movieEro.jkNoticeBoard.vo.noticeVO;

@Service("NTService")
public class noticeServiceImpl implements noticeService{
	@Autowired
	noticeDao NTDao;

	@Override
	public int insertNoticeBoard(noticeVO noticeVO) {
		return NTDao.insertNoticeBoard(noticeVO);
	}

	@Override
	public ArrayList<noticeVO> selectListAdmin(int currentPage, int limit) {
		
		return NTDao.selectListAdmin(currentPage,limit);
	}

	@Override
	public noticeVO selectNoticeBoard(int NOTICE_BOARD_NO) {
		
		return NTDao.selectNoticeBoard(NOTICE_BOARD_NO);
	}

	@Override
	public int getListCount() {
		System.out.println("서비스 도착");
		return NTDao.getListCount();
	}

	@Override
	public void addReadCount(int NOTICE_BOARD_NO) {
		NTDao.addReadCount(NOTICE_BOARD_NO);
		
	}

	@Override
	public noticeVO selectBoardDetail(int NOTICE_BOARD_NO) {
		// TODO Auto-generated method stub
		return NTDao.selectBoardDetail(NOTICE_BOARD_NO);
	}


	
}
