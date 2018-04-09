package com.army.movieEro.jkNoticeBoard.vo;

public class paymentVO {

	private String CINEMA_NAME;
	private String CINEMA_SECTION;
	private String CINEMA_MOVIE;
	private String CINEMA_MOVIE_TIME;
	private String CINEMA_MOVIE_SEAT;
	private String MB_ID;
	private String CINEMA_RESERVE_NO;
	
	public paymentVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


	public paymentVO(String CINEMA_NAME, String CINEMA_SECTION, String CINEMA_MOVIE, String CINEMA_MOVIE_TIME,
			String CINEMA_MOVIE_SEAT, String MB_ID, String CINEMA_RESERVE_NO) {
		super();
		this.CINEMA_NAME = CINEMA_NAME;
		this.CINEMA_SECTION = CINEMA_SECTION;
		this.CINEMA_MOVIE = CINEMA_MOVIE;
		this.CINEMA_MOVIE_TIME = CINEMA_MOVIE_TIME;
		this.CINEMA_MOVIE_SEAT = CINEMA_MOVIE_SEAT;
		this.MB_ID = MB_ID;
		this.CINEMA_RESERVE_NO = CINEMA_RESERVE_NO;
	}




	public String getCINEMA_RESERVE_NO() {
		return CINEMA_RESERVE_NO;
	}




	public void setCINEMA_RESERVE_NO(String CINEMA_RESERVE_NO) {
		this.CINEMA_RESERVE_NO = CINEMA_RESERVE_NO;
	}




	public String getCINEMA_NAME() {
		return CINEMA_NAME;
	}


	public String getCINEMA_SECTION() {
		return CINEMA_SECTION;
	}


	public String getCINEMA_MOVIE() {
		return CINEMA_MOVIE;
	}


	public String getCINEMA_MOVIE_TIME() {
		return CINEMA_MOVIE_TIME;
	}


	public String getCINEMA_MOVIE_SEAT() {
		return CINEMA_MOVIE_SEAT;
	}


	public String getMB_ID() {
		return MB_ID;
	}


	public void setCINEMA_NAME(String CINEMA_NAME) {
		this.CINEMA_NAME = CINEMA_NAME;
	}


	public void setCINEMA_SECTION(String CINEMA_SECTION) {
		this.CINEMA_SECTION = CINEMA_SECTION;
	}


	public void setCINEMA_MOVIE(String CINEMA_MOVIE) {
		this.CINEMA_MOVIE = CINEMA_MOVIE;
	}


	public void setCINEMA_MOVIE_TIME(String CINEMA_MOVIE_TIME) {
		this.CINEMA_MOVIE_TIME = CINEMA_MOVIE_TIME;
	}


	public void setCINEMA_MOVIE_SEAT(String CINEMA_MOVIE_SEAT) {
		this.CINEMA_MOVIE_SEAT = CINEMA_MOVIE_SEAT;
	}


	public void setMB_ID(String MB_ID) {
		this.MB_ID = MB_ID;
	}




	@Override
	public String toString() {
		return "paymentVO [CINEMA_NAME=" + CINEMA_NAME + ", CINEMA_SECTION=" + CINEMA_SECTION + ", CINEMA_MOVIE="
				+ CINEMA_MOVIE + ", CINEMA_MOVIE_TIME=" + CINEMA_MOVIE_TIME + ", CINEMA_MOVIE_SEAT=" + CINEMA_MOVIE_SEAT
				+ ", MB_ID=" + MB_ID + ", CINEMA_RESERVE_NO=" + CINEMA_RESERVE_NO + "]";
	}

	
	
	
	
}
/*

CREATE TABLE "ARMY"."CINEMA_RESERVE" 
(	"CINEMA_NAME" VARCHAR2(200 BYTE), 
	"CINEMA_SECTION" VARCHAR2(50 BYTE), 
	"CINEMA_MOVIE" VARCHAR2(50 BYTE), 
	"CINEMA_MOVIE_TIME" VARCHAR2(30 BYTE), 
	"CINEMA_MOVIE_SEAT" VARCHAR2(20 BYTE), 
	"MB_ID" VARCHAR2(30 BYTE), 
*/