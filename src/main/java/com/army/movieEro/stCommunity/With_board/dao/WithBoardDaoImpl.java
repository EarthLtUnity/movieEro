package com.army.movieEro.stCommunity.With_board.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.stCommunity.With_board.vo.WithBoard;

@Repository("bDao")
public class WithBoardDaoImpl implements WithBoardDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return sqlSession.selectOne("WithBoard.getListCount");
	}

	@Override
	public ArrayList<WithBoard> selectList(int currentPage, int limit) {
		System.out.println("DAO Impl");
		//int offset = (currentPage - 1) * limit;
		//RowBounds rows = new RowBounds(offset, limit);
		//return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.selectList", null, rows));
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.selectList"));
	}

	@Override
	public WithBoard selectBoard(int boardNum) {
		return sqlSession.selectOne("WithBoard.selectOne",boardNum);
	}

	@Override
	public int insertBoard(WithBoard b) {
		return sqlSession.insert("WithBoard.insertBoard", b);
	}

	@Override
	public int addReadCount(int boardNum) {
		return sqlSession.update("Board.addReadCount", boardNum);
	}
	
	
}
