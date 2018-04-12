package com.army.movieEro.tkTheaterPayment.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.tkTheaterPayment.dao.TheaterPaymentDaoImpl;
import com.army.movieEro.tkTheaterPayment.vo.TheaterPayment;
import com.army.movieEro.tkTheaterRental.vo.theaterVO;

@Service("theaterPaymentServiceImpl")
public class TheaterPaymentServiceImpl implements TheaterPaymentService {

	@Autowired
	private TheaterPaymentDaoImpl theaterPaymentServiceImpl;
	
	@Override
	public ArrayList<TheaterPayment> selectPayList(HashMap<String, String> visualMap) {
		// TODO Auto-generated method stub
		return theaterPaymentServiceImpl.selectPayList(visualMap);
	}

	@Override
	public int insertPayment(TheaterPayment vo) {
		// TODO Auto-generated method stub
		return theaterPaymentServiceImpl.insertPayment(vo);
	}

	@Override
	public int updatePayment(int bnum) {
		// TODO Auto-generated method stub
		return theaterPaymentServiceImpl.updatePayment(bnum);
	}

	@Override
	public ArrayList<TheaterPayment> selectPayList(String MB_ID) {
		// TODO Auto-generated method stub
		return theaterPaymentServiceImpl.selectPayList(MB_ID);
	}

	@Override
	public theaterVO selectpayposition(String position) {
		// TODO Auto-generated method stub
		return theaterPaymentServiceImpl.selectpayposition(position);
	}

}
