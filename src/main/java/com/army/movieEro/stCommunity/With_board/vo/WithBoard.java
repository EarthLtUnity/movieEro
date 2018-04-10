package com.army.movieEro.stCommunity.With_board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class WithBoard implements java.io.Serializable{
	
	private static final long serialVersionUID = 3000000L;
	
	private int WITH_BOARD_NO;
	private String WITH_BOARD_WRITER;
	private String WITH_BOARD_TITLE;
	private String WITH_BOARD_CONTENT;
	private String WITH_BOARD_NOW_ID;
	private int WITH_BOARD_NOW_NO;
	private int WITH_BOARD_APPLY_NO;
	private int WITH_BOARD_READCOUNT;
	private Date WITH_BOARD_DATE;
	
	
	public WithBoard() {}


	
	public WithBoard(int wITH_BOARD_NO, String wITH_BOARD_WRITER, String wITH_BOARD_TITLE, String wITH_BOARD_CONTENT,
			String wITH_BOARD_NOW_ID, int wITH_BOARD_NOW_NO, int wITH_BOARD_APPLY_NO, int wITH_BOARD_READCOUNT,
			Date wITH_BOARD_DATE) {
		super();
		WITH_BOARD_NO = wITH_BOARD_NO;
		WITH_BOARD_WRITER = wITH_BOARD_WRITER;
		WITH_BOARD_TITLE = wITH_BOARD_TITLE;
		WITH_BOARD_CONTENT = wITH_BOARD_CONTENT;
		WITH_BOARD_NOW_ID = wITH_BOARD_NOW_ID;
		WITH_BOARD_NOW_NO = wITH_BOARD_NOW_NO;
		WITH_BOARD_APPLY_NO = wITH_BOARD_APPLY_NO;
		WITH_BOARD_READCOUNT = wITH_BOARD_READCOUNT;
		WITH_BOARD_DATE = wITH_BOARD_DATE;
	}




	@Override
	public String toString() {
		return "WithBoard [WITH_BOARD_NO=" + WITH_BOARD_NO + ", WITH_BOARD_WRITER=" + WITH_BOARD_WRITER
				+ ", WITH_BOARD_TITLE=" + WITH_BOARD_TITLE + ", WITH_BOARD_CONTENT=" + WITH_BOARD_CONTENT
				+ ", WITH_BOARD_NOW_ID=" + WITH_BOARD_NOW_ID + ", WITH_BOARD_NOW_NO=" + WITH_BOARD_NOW_NO
				+ ", WITH_BOARD_APPLY_NO=" + WITH_BOARD_APPLY_NO + ", WITH_BOARD_READCOUNT=" + WITH_BOARD_READCOUNT
				+ ", WITH_BOARD_DATE=" + WITH_BOARD_DATE + "]";
	}



	public int getWITH_BOARD_NO() {
		return WITH_BOARD_NO;
	}


	public void setWITH_BOARD_NO(int wITH_BOARD_NO) {
		WITH_BOARD_NO = wITH_BOARD_NO;
	}


	public String getWITH_BOARD_WRITER() {
		return WITH_BOARD_WRITER;
	}


	public void setWITH_BOARD_WRITER(String wITH_BOARD_WRITER) {
		WITH_BOARD_WRITER = wITH_BOARD_WRITER;
	}


	public String getWITH_BOARD_TITLE() {
		return WITH_BOARD_TITLE;
	}


	public void setWITH_BOARD_TITLE(String wITH_BOARD_TITLE) {
		WITH_BOARD_TITLE = wITH_BOARD_TITLE;
	}


	public String getWITH_BOARD_CONTENT() {
		return WITH_BOARD_CONTENT;
	}


	public void setWITH_BOARD_CONTENT(String wITH_BOARD_CONTENT) {
		WITH_BOARD_CONTENT = wITH_BOARD_CONTENT;
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


	public int getWITH_BOARD_APPLY_NO() {
		return WITH_BOARD_APPLY_NO;
	}


	public void setWITH_BOARD_APPLY_NO(int wITH_BOARD_APPLY_NO) {
		WITH_BOARD_APPLY_NO = wITH_BOARD_APPLY_NO;
	}


	public int getWITH_BOARD_READCOUNT() {
		return WITH_BOARD_READCOUNT;
	}


	public void setWITH_BOARD_READCOUNT(int wITH_BOARD_READCOUNT) {
		WITH_BOARD_READCOUNT = wITH_BOARD_READCOUNT;
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
