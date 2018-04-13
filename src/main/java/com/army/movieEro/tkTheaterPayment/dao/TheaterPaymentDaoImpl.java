package com.army.movieEro.tkTheaterPayment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.army.movieEro.tkTheaterPayment.vo.TheaterPayment;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Repository("theaterPaymentDaoImpl")

public class TheaterPaymentDaoImpl implements TheaterPaymentDao {

@Autowired
	SqlSession sqlsession;
	@Override
	public ArrayList<TheaterPayment> selectPayList(HashMap<String, String> visualMap) {
		// TODO Auto-generated method stub
		return new ArrayList<TheaterPayment>(sqlsession.selectList("tkPayment.theaterpayselect",visualMap));
	}

	@Override
	public int insertPayment(TheaterPayment vo) {
		// TODO Auto-generated method stub
		return sqlsession.insert("tkPayment.theaterpayinsert",vo);
	}

	@Override
	public int updatePayment(int bnum) {
		// TODO Auto-generated method stub
		return sqlsession.update("tkPayment.theaterpayupdate",bnum);
	}

	@Override
	public ArrayList<TheaterPayment> selectPayList(String MB_ID) {
		// TODO Auto-generated method stub
		return new ArrayList<TheaterPayment>(sqlsession.selectList("tkPayment.mypaymentselect",MB_ID));
	}

	@Override
	public theaterVO selectpayposition(String position) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("tkPayment.myrentalposition",position);
	}

	@Override
	public int countselect(String id) {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("tkPayment.paymentlist",id);
	}

}
