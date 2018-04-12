package com.army.movieEro.jkNoticeBoard.service;

import java.util.HashMap;

import com.army.movieEro.jkNoticeBoard.vo.paymentVO;

public interface reserveService {
	public int reserveInsert(HashMap<String, String> map);

	public int reserveModify(String CINEMA_RESERVE_NO);
}
