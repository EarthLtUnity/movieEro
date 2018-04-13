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

	// 리스트 갯수 가져오기
	@Override
	public int getListCount() {
		return sqlSession.selectOne("WithBoard.getListCount");
	}
	
	// 메인 Table 전체 출력
	@Override
	public ArrayList<WithBoard> selectList(int currentPage, int limit) {
		System.out.println("DAO Impl");
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.selectList"));
	}

	// 서브 Table 전체 출력
	@Override
	public ArrayList<WithBoard_sub> selectListsub(int currentPage, int limit) {
		return new ArrayList<WithBoard_sub>(sqlSession.selectList("WithBoard.selectListsub"));
	}
	
	// 게시판 추가
	@Override
	public int insertBoard(WithBoard b) {
		return sqlSession.insert("WithBoard.insertBoard", b);
	}

	// 결제 & 참여
	@Override
	public int withReserve(WithBoard_sub wSub) {
		return sqlSession.update("WithBoard.withReserve", wSub);
	}
	
	/*Search*/
	
	// searchListCount
	@Override
	public int getListCountSearch(String keyword) {
		System.out.println(keyword+" 도착!! ");
		return sqlSession.selectOne("WithBoard.getSearchListCount", keyword);
	}

	// searchList
	@Override
	public ArrayList<WithBoard> searchList(int currentPage, int limit, String word) {
		return new ArrayList<WithBoard>(sqlSession.selectList("WithBoard.searchList", word));
	}

	@Override
	public int writerPhoneNumber(String writerId) {
		System.out.println("11"+writerId);
		return sqlSession.selectOne("WithBoard.writerPhoneNumber", writerId);
	}

	


	
	
}
