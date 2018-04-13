package com.army.movieEro.rentalQnA.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class RentalQnAVO {

	private String RENTAL_BOARD_TITLE; //제목
	private Date RENTAL_BOARD_DATE; //작성일
	private String RENTAL_BOARD_CONTENT; //내용
	private int RENTAL_BOARD_NO; //게시글 번호
	private String MB_ID; //작성자
	private int RENTAL_REPLY; //리플 갯수
	private String RENTAL_BOARD_POINT; //지역선택
	


	public String getRENTAL_BOARD_POINT() {
		return RENTAL_BOARD_POINT;
	}

	public void setRENTAL_BOARD_POINT(String rENTAL_BOARD_POINT) {
		RENTAL_BOARD_POINT = rENTAL_BOARD_POINT;
	}

	public int getRENTAL_REPLY() {
		return RENTAL_REPLY;
	}

	public void setRENTAL_REPLY(int rENTAL_REPLY) {
		RENTAL_REPLY = rENTAL_REPLY;
	}

	public RentalQnAVO() {
	}

	public RentalQnAVO(String rENTAL_BOARD_TITLE, Date rENTAL_BOARD_DATE, String rENTAL_BOARD_CONTENT,
			int rENTAL_BOARD_NO, String mB_ID, String rENTAL_BOARD_IMAGE) {
		super();
		RENTAL_BOARD_TITLE = rENTAL_BOARD_TITLE;
		RENTAL_BOARD_DATE = rENTAL_BOARD_DATE;
		RENTAL_BOARD_CONTENT = rENTAL_BOARD_CONTENT;
		RENTAL_BOARD_NO = rENTAL_BOARD_NO;
		MB_ID = mB_ID;
	}

	public String getRENTAL_BOARD_TITLE() {
		return RENTAL_BOARD_TITLE;
	}

	public void setRENTAL_BOARD_TITLE(String rENTAL_BOARD_TITLE) {
		RENTAL_BOARD_TITLE = rENTAL_BOARD_TITLE;
	}

	public Date getRENTAL_BOARD_DATE() {
		return RENTAL_BOARD_DATE;
	}

	public void setRENTAL_BOARD_DATE(Date rENTAL_BOARD_DATE) {
		RENTAL_BOARD_DATE = rENTAL_BOARD_DATE;
	}

	public String getRENTAL_BOARD_CONTENT() {
		return RENTAL_BOARD_CONTENT;
	}

	public void setRENTAL_BOARD_CONTENT(String rENTAL_BOARD_CONTENT) {
		RENTAL_BOARD_CONTENT = rENTAL_BOARD_CONTENT;
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

	
	
	
}
