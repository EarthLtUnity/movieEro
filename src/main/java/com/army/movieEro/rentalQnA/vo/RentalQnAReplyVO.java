package com.army.movieEro.rentalQnA.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RentalQnAReplyVO {

	private String RENTAL_BOARD_REPLY_CONTENT;
	private int RENTAL_BOARD_REPLY_NO;
	private int RENTAL_BOARD_NO;
	private String MB_ID;
	private Date RENTAL_BOARD_REPLY_DATE;
	
	public RentalQnAReplyVO() {
	}
	public String getRENTAL_BOARD_REPLY_CONTENT() {
		return RENTAL_BOARD_REPLY_CONTENT;
	}
	public void setRENTAL_BOARD_REPLY_CONTENT(String rENTAL_BOARD_REPLY_CONTENT) {
		RENTAL_BOARD_REPLY_CONTENT = rENTAL_BOARD_REPLY_CONTENT;
	}
	public int getRENTAL_BOARD_REPLY_NO() {
		return RENTAL_BOARD_REPLY_NO;
	}
	public void setRENTAL_BOARD_REPLY_NO(int rENTAL_BOARD_REPLY_NO) {
		RENTAL_BOARD_REPLY_NO = rENTAL_BOARD_REPLY_NO;
	}
	public int getRENTAL_BOARD_NO() {
		return RENTAL_BOARD_NO;
	}
	public void setRENTAL_BOARD_NO(int rENTAL_BOARD_NO) {
		RENTAL_BOARD_NO = rENTAL_BOARD_NO;
	}
	public String getMB_ID() {
		return MB_ID;
	}
	public void setMB_ID(String mB_ID) {
		MB_ID = mB_ID;
	}
	public Date getRENTAL_BOARD_REPLY_DATE() {
		return RENTAL_BOARD_REPLY_DATE;
	}
	public void setRENTAL_BOARD_REPLY_DATE(Date rENTAL_BOARD_REPLY_DATE) {
		RENTAL_BOARD_REPLY_DATE = rENTAL_BOARD_REPLY_DATE;
	}

}
