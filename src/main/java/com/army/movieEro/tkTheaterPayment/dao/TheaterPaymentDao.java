package com.army.movieEro.tkTheaterPayment.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.army.movieEro.tkTheaterPayment.vo.TheaterPayment;


public interface TheaterPaymentDao {

	public ArrayList<TheaterPayment> selectPayList(HashMap<String, String> visualMap);
	
	public int insertPayment(TheaterPayment vo);
	
	public int updatePayment(int bnum);
	
	public ArrayList<TheaterPayment> selectPayList(String MB_ID);
	
}
