package com.army.movieEro.jkNoticeBoard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

public interface reserveDao {

	public int reserveInsert(HashMap<String, String> map);

	public ArrayList<String> seatList(HashMap<String, String> map);

	public ArrayList<paymentVO> selectMypage(String MB_ID);

	public ArrayList<paymentVO> selectMypageAt(String MB_ID);

	public int selectReserveCnt(String MB_ID);

}
