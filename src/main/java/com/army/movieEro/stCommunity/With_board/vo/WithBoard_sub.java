package com.army.movieEro.stCommunity.With_board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class WithBoard_sub implements java.io.Serializable {

	private static final long serialVersionUID = 3000000L;

	private int WITH_BOARD_NO;
	private String WITH_BOARD_NOW_ID;
	private int WITH_BOARD_NOW_NO;
	private Date WITH_BOARD_DATE;

	public WithBoard_sub() {
	}

	@Override
	public String toString() {
		return "WithBoard_sub [WITH_SUB_NO : " + WITH_BOARD_NO 
				+ ", WITH_SUB_NOW_ID : " + WITH_BOARD_NOW_ID
				+ ", WITH_SUB_NOW_NO : " + WITH_BOARD_NOW_NO 
				+ ", WITH_SUB_DATE : " + WITH_BOARD_DATE 
				+ "]";
	}

	public WithBoard_sub(int wITH_BOARD_NO, String wITH_BOARD_NOW_ID, int wITH_BOARD_NOW_NO, Date wITH_BOARD_DATE) {
		super();
		WITH_BOARD_NO = wITH_BOARD_NO;
		WITH_BOARD_NOW_ID = wITH_BOARD_NOW_ID;
		WITH_BOARD_NOW_NO = wITH_BOARD_NOW_NO;
		WITH_BOARD_DATE = wITH_BOARD_DATE;
	}

	public int getWITH_BOARD_NO() {
		return WITH_BOARD_NO;
	}

	public void setWITH_BOARD_NO(int wITH_BOARD_NO) {
		WITH_BOARD_NO = wITH_BOARD_NO;
	}

	public String getWITH_BOARD_NOW_ID() {
		return WITH_BOARD_NOW_ID;
	}

	public void setWITH_BOARD_NOW_ID(String wITH_BOARD_NOW_ID) {
		WITH_BOARD_NOW_ID = wITH_BOARD_NOW_ID;
	}

	public int getWITH_BOARD_NOW_NO() {
		return WITH_BOARD_NOW_NO;
	}

	public void setWITH_BOARD_NOW_NO(int wITH_BOARD_NOW_NO) {
		WITH_BOARD_NOW_NO = wITH_BOARD_NOW_NO;
	}

	public Date getWITH_BOARD_DATE() {
		return WITH_BOARD_DATE;
	}

	public void setWITH_BOARD_DATE(Date wITH_BOARD_DATE) {
		WITH_BOARD_DATE = wITH_BOARD_DATE;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	
}
