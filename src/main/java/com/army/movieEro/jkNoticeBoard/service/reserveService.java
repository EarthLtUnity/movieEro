package com.army.movieEro.jkNoticeBoard.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

public interface reserveService {
	public int reserveInsert(HashMap<String, String> map);

	public ArrayList<String> seatList(HashMap<String, String> map);

}
