package com.army.movieEro.stCommunity.With_board.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.stCommunity.With_board.dao.WithBoardDao;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard_sub;

@Service("bService")
public class WithBoardServiceImpl implements WithBoardService {

	@Autowired
	WithBoardDao bDao;
	
	@Override
	public int getListCount() {
		return bDao.getListCount();
	}

	@Override //
	public ArrayList<WithBoard> selectList(int currentPage, int limit) {
		System.out.println("service Impl");
		return bDao.selectList(currentPage, limit);
	}

	@Override
	public ArrayList<WithBoard> selectListsub(int currentPage, int limit) {
		return bDao.selectListsub(currentPage, limit);
	}
	
	@Override
	public WithBoard selectBoard(int boardNum) {
		return bDao.selectBoard(boardNum);
	}

	@Override
	public int insertBoard(WithBoard b) {
		return bDao.insertBoard(b);
	}

	@Override
	public int withReserve(int bNo, String bNo_id) {
		// 유효성 검증
		WithBoard_sub wSub = new WithBoard_sub();
		wSub.setWITH_BOARD_NO(bNo);
		wSub.setWITH_BOARD_NOW_ID(bNo_id);
		
		return bDao.withReserve(wSub);		
	}
}
