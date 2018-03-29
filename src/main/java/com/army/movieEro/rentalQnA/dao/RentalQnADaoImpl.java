package com.army.movieEro.rentalQnA.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.rentalQnA.vo.RentalQnAVO;

@Repository("rentalQnADaoImpl")
public class RentalQnADaoImpl implements RentalQnADao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<RentalQnAVO> selectList(int currentPage, int limit) {
		// TODO Auto-generated method stub
		int offset = (currentPage - 1) * limit;
		RowBounds rows = new RowBounds(offset, limit);
		return new ArrayList<RentalQnAVO>(sqlSession.selectList("QnA.selectList", null, rows));
	}

	@Override
	public RentalQnAVO selectBoard(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QnA.selectBoard",boardNum);
	}

	@Override
	public int insertBoard(RentalQnAVO r) {
		// TODO Auto-generated method stub
		return sqlSession.insert("QnA.insertBoard",r);
	}

	@Override
	public int updateBoard(RentalQnAVO r) {
		// TODO Auto-generated method stub
		return sqlSession.update("QnA.updateBoard",r);
	}

	@Override
	public int deleteBoard(int boardNum) {
		// TODO Auto-generated method stub
		return sqlSession.delete("QnA.deleteBoard",boardNum);
	}

	@Override
	public int getListCount(String point) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QnA.getPointListCount");
	}

	@Override
	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("QnA.getListCount");
	}




}
