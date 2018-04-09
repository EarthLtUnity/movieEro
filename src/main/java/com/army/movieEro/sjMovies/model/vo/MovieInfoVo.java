package com.army.movieEro.sjMovies.model.vo;

public class MovieInfoVo {
	private String MV_TITLE;
	private String MV_SUB_TITLE;
	private String MV_PUB_DATE;
	private String MV_DIRECTOR;
	private String MV_ACTOR;
	private String MV_USER_RATING;
	private String MV_LINK;
	private String MV_IMAGE;
	private int MV_INFO_SEQ;

	public MovieInfoVo() {
		super();
	}

	public MovieInfoVo(String mV_TITLE, String mV_SUB_TITLE, String mV_PUB_DATE, String mV_DIRECTOR, String mV_ACTOR,
			String mV_USER_RATING, String mV_LINK, String mV_IMAGE, int mV_INFO_SEQ) {
		super();
		MV_TITLE = mV_TITLE;
		MV_SUB_TITLE = mV_SUB_TITLE;
		MV_PUB_DATE = mV_PUB_DATE;
		MV_DIRECTOR = mV_DIRECTOR;
		MV_ACTOR = mV_ACTOR;
		MV_USER_RATING = mV_USER_RATING;
		MV_LINK = mV_LINK;
		MV_IMAGE = mV_IMAGE;
		MV_INFO_SEQ = mV_INFO_SEQ;
	}

	public String getMV_TITLE() {
		return MV_TITLE;
	}

	public void setMV_TITLE(String mV_TITLE) {
		MV_TITLE = mV_TITLE;
	}

	public String getMV_SUB_TITLE() {
		return MV_SUB_TITLE;
	}

	public void setMV_SUB_TITLE(String mV_SUB_TITLE) {
		MV_SUB_TITLE = mV_SUB_TITLE;
	}

	public String getMV_PUB_DATE() {
		return MV_PUB_DATE;
	}

	public void setMV_PUB_DATE(String mV_PUB_DATE) {
		MV_PUB_DATE = mV_PUB_DATE;
	}

	public String getMV_DIRECTOR() {
		return MV_DIRECTOR;
	}

	public void setMV_DIRECTOR(String mV_DIRECTOR) {
		MV_DIRECTOR = mV_DIRECTOR;
	}

	public String getMV_ACTOR() {
		return MV_ACTOR;
	}

	public void setMV_ACTOR(String mV_ACTOR) {
		MV_ACTOR = mV_ACTOR;
	}

	public String getMV_USER_RATING() {
		return MV_USER_RATING;
	}

	public void setMV_USER_RATING(String mV_USER_RATING) {
		MV_USER_RATING = mV_USER_RATING;
	}

	public String getMV_LINK() {
		return MV_LINK;
	}

	public void setMV_LINK(String mV_LINK) {
		MV_LINK = mV_LINK;
	}

	public String getMV_IMAGE() {
		return MV_IMAGE;
	}

	public void setMV_IMAGE(String mV_IMAGE) {
		MV_IMAGE = mV_IMAGE;
	}

	public int getMV_INFO_SEQ() {
		return MV_INFO_SEQ;
	}

	public void setMV_INFO_SEQ(int mV_INFO_SEQ) {
		MV_INFO_SEQ = mV_INFO_SEQ;
	}

	@Override
	public String toString() {
		return "MovieListVo [MV_TITLE=" + MV_TITLE + ", MV_SUB_TITLE=" + MV_SUB_TITLE + ", MV_PUB_DATE=" + MV_PUB_DATE
				+ ", MV_DIRECTOR=" + MV_DIRECTOR + ", MV_ACTOR=" + MV_ACTOR + ", MV_USER_RATING=" + MV_USER_RATING
				+ ", MV_LINK=" + MV_LINK + ", MV_IMAGE=" + MV_IMAGE + ", MV_INFO_SEQ=" + MV_INFO_SEQ + "]";
	}

}
