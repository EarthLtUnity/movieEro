package com.army.movieEro.jkNoticeBoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

@Repository("REDao")
public class reserveDaoImpl implements reserveDao{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int reserveInsert(HashMap<String, String> map) {
		return sqlSession.insert("paymentVO.reserveInsert",map);
	}


	@Override
	public int reserveModify(String CINEMA_RESERVE_NO) {
		// TODO Auto-generated method stub
		return sqlSession.update("paymentVO.reserveModify",CINEMA_RESERVE_NO);
	}




	

}
