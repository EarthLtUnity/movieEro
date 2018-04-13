package com.army.movieEro.stCommunity.With_board.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.stCommunity.With_board.vo.WithBoard;
import com.army.movieEro.stCommunity.With_board.vo.WithBoard_sub;

@Repository("bDao")
public class WithBoardDaoImpl implements WithBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sqlSession.selectOne("WithBoard.getListCount");
	}
	
	@Override
	public int getListCountSearch(String keyword) {
		System.out.println(keyword+" 도착!! ");
		return sqlSession.selectOne("WithBoard.getSearchListCount", keyword);
	}

	@Override
	public ArrayList<WithBoard> selectList(int currentPage, int limit) {
		System.out.println("DAO Impl");
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.selectList"));
	}

	@Override
	public ArrayList<WithBoard_sub> selectListsub(int currentPage, int limit) {
		return new ArrayList<WithBoard_sub>(sqlSession.selectList("WithBoard.selectListsub"));
	}
	
	@Override
	public int insertBoard(WithBoard b) {
		return sqlSession.insert("WithBoard.insertBoard", b);
	}

	@Override
	public int withReserve(WithBoard_sub wSub) {
		return sqlSession.update("WithBoard.withReserve", wSub);
	}

	@Override
	public ArrayList<WithBoard> searchList(int currentPage, int limit, String word) {
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.searchList", word));
	}

	@Override
	public ArrayList<WithBoard> searchListsub(int currentPage, int limit, String word) {
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.searchListsub"));
	}


	
	
}
