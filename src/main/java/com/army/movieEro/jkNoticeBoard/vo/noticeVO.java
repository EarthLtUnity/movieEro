package com.army.movieEro.jkNoticeBoard.vo;

import java.sql.Date;

public class noticeVO {
	private String MB_ID;
	private String NOTICE_BOARD_TITLE;
	private String NOTICE_BOARD_CONTENT;
	private Date NOTICE_BOARD_DATE;
	private String NOTICE_BOARD_PICTURE;
	private int NOTICE_BOARD_READCNT;
	private int NOTICE_BOARD_NO;
	
	public noticeVO() {}

	public noticeVO(String mB_ID, String nOTICE_BOARD_TITLE, String nOTICE_BOARD_CONTENT, Date nOTICE_BOARD_DATE,
			String nOTICE_BOARD_PICTURE, int nOTICE_BOARD_READCNT, int nOTICE_BOARD_NO) {
		super();
		MB_ID = mB_ID;
		NOTICE_BOARD_TITLE = nOTICE_BOARD_TITLE;
		NOTICE_BOARD_CONTENT = nOTICE_BOARD_CONTENT;
		NOTICE_BOARD_DATE = nOTICE_BOARD_DATE;
		NOTICE_BOARD_PICTURE = nOTICE_BOARD_PICTURE;
		NOTICE_BOARD_READCNT = nOTICE_BOARD_READCNT;
		NOTICE_BOARD_NO = nOTICE_BOARD_NO;
	}

	public String getMB_ID() {
		return MB_ID;
	}

	public void setMB_ID(String mB_ID) {
		MB_ID = mB_ID;
	}

	public String getNOTICE_BOARD_TITLE() {
		return NOTICE_BOARD_TITLE;
	}

	public void setNOTICE_BOARD_TITLE(String nOTICE_BOARD_TITLE) {
		NOTICE_BOARD_TITLE = nOTICE_BOARD_TITLE;
	}

	public String getNOTICE_BOARD_CONTENT() {
		return NOTICE_BOARD_CONTENT;
	}

	public void setNOTICE_BOARD_CONTENT(String nOTICE_BOARD_CONTENT) {
		NOTICE_BOARD_CONTENT = nOTICE_BOARD_CONTENT;
	}

	public Date getNOTICE_BOARD_DATE() {
		return NOTICE_BOARD_DATE;
	}

	public void setNOTICE_BOARD_DATE(Date nOTICE_BOARD_DATE) {
		NOTICE_BOARD_DATE = nOTICE_BOARD_DATE;
	}

	public String getNOTICE_BOARD_PICTURE() {
		return NOTICE_BOARD_PICTURE;
	}

	public void setNOTICE_BOARD_PICTURE(String nOTICE_BOARD_PICTURE) {
		NOTICE_BOARD_PICTURE = nOTICE_BOARD_PICTURE;
	}

	public int getNOTICE_BOARD_READCNT() {
		return NOTICE_BOARD_READCNT;
	}

	public void setNOTICE_BOARD_READCNT(int nOTICE_BOARD_READCNT) {
		NOTICE_BOARD_READCNT = nOTICE_BOARD_READCNT;
	}

	public int getNOTICE_BOARD_NO() {
		return NOTICE_BOARD_NO;
	}

	public void setNOTICE_BOARD_NO(int nOTICE_BOARD_NO) {
		NOTICE_BOARD_NO = nOTICE_BOARD_NO;
	}
	
	
}

