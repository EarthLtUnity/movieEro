package com.army.movieEro.jkNoticeBoard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	public ArrayList<String> seatList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return new ArrayList<String>(sqlSession.selectList("paymentVO.seatList",map));
	}


	@Override
	public ArrayList<paymentVO> selectMypage(String MB_ID) {
		return new ArrayList<paymentVO>(sqlSession.selectList("paymentVO.selectMypage",MB_ID));
	}


	@Override
	public ArrayList<paymentVO> selectMypageAt(String MB_ID) {
		// TODO Auto-generated method stub
		return new ArrayList<paymentVO>(sqlSession.selectList("paymentVO.selectMypageAt",MB_ID));
	}






	

}
