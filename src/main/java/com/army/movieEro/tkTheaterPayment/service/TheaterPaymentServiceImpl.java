package com.army.movieEro.tkTheaterPayment.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.army.movieEro.tkTheaterPayment.dao.TheaterPaymentDaoImpl;
import com.army.movieEro.tkTheaterPayment.vo.TheaterPayment;

@Service("theaterPaymentServiceImpl")
public class TheaterPaymentServiceImpl implements TheaterPaymentService {

	@Autowired
	private TheaterPaymentDaoImpl theaterPaymentServiceImpl;
	
	@Override
	public ArrayList<TheaterPayment> selectPayList(HashMap<String, String> visualMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertPayment() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updatePayment() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<TheaterPayment> selectPayList(String MB_ID) {
		// TODO Auto-generated method stub
		return null;
	}

}
