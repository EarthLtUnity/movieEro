package com.army.movieEro.jkNoticeBoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.jkNoticeBoard.vo.noticeVO;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

@Repository("NTDao")
public class noticeDaoImpl implements noticeDao{

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertNoticeBoard(noticeVO noticeVO) {
		return sqlSession.insert("noticeVO.insertNoticeBoard",noticeVO);
	}

	@Override
	public ArrayList<noticeVO> selectListAdmin(int currentPage, int limit) {
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<noticeVO>(sqlSession.selectList("noticeVO.selectListAdmin",null,rows));
	}

	@Override
	public noticeVO selectNoticeBoard(int NOTICE_BOARD_NO) {
		
		return sqlSession.selectOne("noticeVO.selectOne",NOTICE_BOARD_NO);
	}

	@Override
	public int getListCount() {
		System.out.println("DAO도착");
		return sqlSession.selectOne("noticeVO.getListCount");
	}

	@Override
	public int addReadCount(int NOTICE_BOARD_NO) {
		return sqlSession.update("noticeVO.addReadCount",NOTICE_BOARD_NO);
		
	}

	@Override
	public noticeVO selectBoardDetail(int NOTICE_BOARD_NO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("noticeVO.selectBoardDetail",NOTICE_BOARD_NO);
	}

	@Override
	public int modifyNoticeBoard(noticeVO noticeVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("noticeVO.modifyNoticeBoard",noticeVO);
	}

}
