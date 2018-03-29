package com.army.movieEro.jkNoticeBoard.vo;

import java.sql.Date;

public class noticeReplyVO {

	public noticeReplyVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	private String MB_ID;
	private int NOTICE_BOARD_NO;
	private String NOTICE_REPLY_CONTENT;
	private Date NOTICE_REPLY_DATE;
	public noticeReplyVO(String MB_ID, int NOTICE_BOARD_NO, String NOTICE_REPLY_CONTENT, Date NOTICE_REPLY_DATE) {
		super();
		this.MB_ID = MB_ID;
		this.NOTICE_BOARD_NO = NOTICE_BOARD_NO;
		this.NOTICE_REPLY_CONTENT = NOTICE_REPLY_CONTENT;
		this.NOTICE_REPLY_DATE = NOTICE_REPLY_DATE;
	}
	public String getMB_ID() {
		return MB_ID;
	}
	public int getNOTICE_BOARD_NO() {
		return NOTICE_BOARD_NO;
	}
	public String getNOTICE_REPLY_CONTENT() {
		return NOTICE_REPLY_CONTENT;
	}
	public Date getNOTICE_REPLY_DATE() {
		return NOTICE_REPLY_DATE;
	}
	public void setMB_ID(String MB_ID) {
		this.MB_ID = MB_ID;
	}
	public void setNOTICE_BOARD_NO(int NOTICE_BOARD_NO) {
		this.NOTICE_BOARD_NO = NOTICE_BOARD_NO;
	}
	public void setNOTICE_REPLY_CONTENT(String NOTICE_REPLY_CONTENT) {
		this.NOTICE_REPLY_CONTENT = NOTICE_REPLY_CONTENT;
		
	}
	public void setNOTICE_REPLY_DATE(Date NOTICE_REPLY_DATE) {
		this.NOTICE_REPLY_DATE = NOTICE_REPLY_DATE;
	}
	
	
	
	
}
/*"MB_ID" VARCHAR2(20 BYTE), 
"NOTICE_BOARD_NO" VARCHAR2(20 BYTE), 
"NOTICE_REPLY_CONTENT" VARCHAR2(300 BYTE), 
"NOTICE_REPLY_DATE" DATE, */