package com.army.movieEro.jkNoticeBoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.mybatis.spring.SqlSessionTemplate;
import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

@Repository("REDao")
public class reserveDaoImpl implements reserveDao{

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int reserveInsert(paymentVO paymentVO) {
		return sqlSession.insert("paymentVO.reserveInsert",paymentVO);
	}




	

}
