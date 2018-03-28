package com.army.movieEro.stCommunity.With_board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class WithBoard implements java.io.Serializable{
	
	private static final long serialVersionUID = 3000000L;
	
	private int WHID_BOARD_NO;
	private String WHID_BOARD_WRITER;
	private String WHID_BOARD_TITLE;
	private String WHID_BOARD_CONTENT;
	private String WHID_BOARD_NOW_ID;
	private int WHID_BOARD_NOW_NO;
	private int WHID_BOARD_APPLY_NO;
	private int WHID_BOARD_READCOUNT;
	private Date WHID_BOARD_DATE;
	
	
	public WithBoard() {}
	
	public WithBoard(int wHID_BOARD_NO, String wHID_BOARD_WRITER, String wHID_BOARD_TITLE, String wHID_BOARD_CONTENT,
			String wHID_BOARD_NOW_ID, int wHID_BOARD_NOW_NO, int wHID_BOARD_APPLY_NO, int wHID_BOARD_READCOUNT,
			Date wHID_BOARD_DATE) {
		super();
		WHID_BOARD_NO = wHID_BOARD_NO;
		WHID_BOARD_WRITER = wHID_BOARD_WRITER;
		WHID_BOARD_TITLE = wHID_BOARD_TITLE;
		WHID_BOARD_CONTENT = wHID_BOARD_CONTENT;
		WHID_BOARD_NOW_ID = wHID_BOARD_NOW_ID;
		WHID_BOARD_NOW_NO = wHID_BOARD_NOW_NO;
		WHID_BOARD_APPLY_NO = wHID_BOARD_APPLY_NO;
		WHID_BOARD_READCOUNT = wHID_BOARD_READCOUNT;
		WHID_BOARD_DATE = wHID_BOARD_DATE;
		
		System.out.println("11");
	}

	public int getWHID_BOARD_NO() {
		System.out.println("12");
		return WHID_BOARD_NO;
	}

	public void setWHID_BOARD_NO(int wHID_BOARD_NO) {
		System.out.println("13");
		WHID_BOARD_NO = wHID_BOARD_NO;
	}

	public String getWHID_BOARD_WRITER() {
		System.out.println("14");
		return WHID_BOARD_WRITER;
	}

	public void setWHID_BOARD_WRITER(String wHID_BOARD_WRITER) {
		System.out.println("15");
		WHID_BOARD_WRITER = wHID_BOARD_WRITER;
	}

	public String getWHID_BOARD_TITLE() {
		System.out.println("16");
		return WHID_BOARD_TITLE;
	}

	public void setWHID_BOARD_TITLE(String wHID_BOARD_TITLE) {
		System.out.println("17");
		WHID_BOARD_TITLE = wHID_BOARD_TITLE;
	}

	public String getWHID_BOARD_CONTENT() {
		System.out.println("18");
		return WHID_BOARD_CONTENT;
	}

	public void setWHID_BOARD_CONTENT(String wHID_BOARD_CONTENT) {
		System.out.println("19");
		WHID_BOARD_CONTENT = wHID_BOARD_CONTENT;
	}

	public String getWHID_BOARD_NOW_ID() {
		System.out.println("20");
		return WHID_BOARD_NOW_ID;
	}

	public void setWHID_BOARD_NOW_ID(String wHID_BOARD_NOW_ID) {
		System.out.println("21");
		WHID_BOARD_NOW_ID = wHID_BOARD_NOW_ID;
	}

	public int getWHID_BOARD_NOW_NO() {
		System.out.println("22");
		return WHID_BOARD_NOW_NO;
	}

	public void setWHID_BOARD_NOW_NO(int wHID_BOARD_NOW_NO) {
		System.out.println("23");
		WHID_BOARD_NOW_NO = wHID_BOARD_NOW_NO;
	}

	public int getWHID_BOARD_APPLY_NO() {
		System.out.println("24");
		return WHID_BOARD_APPLY_NO;
	}

	public void setWHID_BOARD_APPLY_NO(int wHID_BOARD_APPLY_NO) {
		System.out.println("25");
		WHID_BOARD_APPLY_NO = wHID_BOARD_APPLY_NO;
	}

	public int getWHID_BOARD_READCOUNT() {
		System.out.println("26");
		return WHID_BOARD_READCOUNT;
	}

	public void setWHID_BOARD_READCOUNT(int wHID_BOARD_READCOUNT) {
		System.out.println("27");
		WHID_BOARD_READCOUNT = wHID_BOARD_READCOUNT;
	}

	public Date getWHID_BOARD_DATE() {
		System.out.println("28");
		return WHID_BOARD_DATE;
	}

	public void setWHID_BOARD_DATE(Date wHID_BOARD_DATE) {
		System.out.println("29");
		WHID_BOARD_DATE = wHID_BOARD_DATE;
	}

	public static long getSerialversionuid() {
		System.out.println("30");
		return serialVersionUID;
	}
	
	
	
}
