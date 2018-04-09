package com.army.movieEro.sjMovies.model.vo;

public class MovieReviewVo {
	private int MV_RV_SEQ;
	private String USER_ID;
	private int MV_INFO_SEQ;
	private String MV_TITLE;
	private String MV_RV_TITLE;
	private String MV_RV_CONTENTS;
	private int MV_RV_RATING;
	
	public MovieReviewVo() {
		super();
	}

	public MovieReviewVo(int mV_RV_SEQ, String uSER_ID, int mV_INFO_SEQ, String mV_TITLE, String mV_RV_TITLE,
			String mV_RV_CONTENTS, int mV_RV_RATING) {
		super();
		MV_RV_SEQ = mV_RV_SEQ;
		USER_ID = uSER_ID;
		MV_INFO_SEQ = mV_INFO_SEQ;
		MV_TITLE = mV_TITLE;
		MV_RV_TITLE = mV_RV_TITLE;
		MV_RV_CONTENTS = mV_RV_CONTENTS;
		MV_RV_RATING = mV_RV_RATING;
	}

	public int getMV_RV_SEQ() {
		return MV_RV_SEQ;
	}

	public void setMV_RV_SEQ(int mV_RV_SEQ) {
		MV_RV_SEQ = mV_RV_SEQ;
	}

	public String getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}

	public int getMV_INFO_SEQ() {
		return MV_INFO_SEQ;
	}

	public void setMV_INFO_SEQ(int mV_INFO_SEQ) {
		MV_INFO_SEQ = mV_INFO_SEQ;
	}

	public String getMV_TITLE() {
		return MV_TITLE;
	}

	public void setMV_TITLE(String mV_TITLE) {
		MV_TITLE = mV_TITLE;
	}

	public String getMV_RV_TITLE() {
		return MV_RV_TITLE;
	}

	public void setMV_RV_TITLE(String mV_RV_TITLE) {
		MV_RV_TITLE = mV_RV_TITLE;
	}

	public String getMV_RV_CONTENTS() {
		return MV_RV_CONTENTS;
	}

	public void setMV_RV_CONTENTS(String mV_RV_CONTENTS) {
		MV_RV_CONTENTS = mV_RV_CONTENTS;
	}

	public int getMV_RV_RATING() {
		return MV_RV_RATING;
	}

	public void setMV_RV_RATING(int mV_RV_RATING) {
		MV_RV_RATING = mV_RV_RATING;
	}

	@Override
	public String toString() {
		return "MovieReviewVo [MV_RV_SEQ=" + MV_RV_SEQ + ", USER_ID=" + USER_ID + ", MV_INFO_SEQ=" + MV_INFO_SEQ
				+ ", MV_TITLE=" + MV_TITLE + ", MV_RV_TITLE=" + MV_RV_TITLE + ", MV_RV_CONTENTS=" + MV_RV_CONTENTS
				+ ", MV_RV_RATING=" + MV_RV_RATING + "]";
	}
	
}
