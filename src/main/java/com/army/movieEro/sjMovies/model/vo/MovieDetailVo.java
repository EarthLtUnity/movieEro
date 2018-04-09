package com.army.movieEro.sjMovies.model.vo;

public class MovieDetailVo {
	private int MV_DETAIL_SEQ;
	private int MV_INFO_SEQ;
	private String MV_LINK;
	private String MV_TITLE;
	private String MV_GENRE;
	private String MV_COUNTRY;
	private String MV_RUNTIME;
	private String MV_RELEASE_DATE;
	private String MV_ACTOR;
	private String MV_DIRECTOR;
	private String MV_GRADE;
	private String MV_STORY;
	
	public MovieDetailVo() {
		super();
	}

	
	
	public MovieDetailVo(int mV_DETAIL_SEQ, int mV_INFO_SEQ, String mV_LINK, String mV_TITLE, String mV_GENRE,
			String mV_COUNTRY, String mV_RUNTIME, String mV_RELEASE_DATE, String mV_ACTOR, String mV_DIRECTOR,
			String mV_GRADE, String mV_STORY) {
		super();
		MV_DETAIL_SEQ = mV_DETAIL_SEQ;
		MV_INFO_SEQ = mV_INFO_SEQ;
		MV_LINK = mV_LINK;
		MV_TITLE = mV_TITLE;
		MV_GENRE = mV_GENRE;
		MV_COUNTRY = mV_COUNTRY;
		MV_RUNTIME = mV_RUNTIME;
		MV_RELEASE_DATE = mV_RELEASE_DATE;
		MV_ACTOR = mV_ACTOR;
		MV_DIRECTOR = mV_DIRECTOR;
		MV_GRADE = mV_GRADE;
		MV_STORY = mV_STORY;
	}



	public int getMV_DETAIL_SEQ() {
		return MV_DETAIL_SEQ;
	}

	public void setMV_DETAIL_SEQ(int mV_DETAIL_SEQ) {
		MV_DETAIL_SEQ = mV_DETAIL_SEQ;
	}

	public int getMV_INFO_SEQ() {
		return MV_INFO_SEQ;
	}

	public void setMV_INFO_SEQ(int mV_INFO_SEQ) {
		MV_INFO_SEQ = mV_INFO_SEQ;
	}

	public String getMV_LINK() {
		return MV_LINK;
	}

	public void setMV_LINK(String mV_LINK) {
		MV_LINK = mV_LINK;
	}

	public String getMV_TITLE() {
		return MV_TITLE;
	}

	public void setMV_TITLE(String mV_TITLE) {
		MV_TITLE = mV_TITLE;
	}

	public String getMV_GENRE() {
		return MV_GENRE;
	}

	public void setMV_GENRE(String mV_GENRE) {
		MV_GENRE = mV_GENRE;
	}

	public String getMV_COUNTRY() {
		return MV_COUNTRY;
	}

	public void setMV_COUNTRY(String mV_COUNTRY) {
		MV_COUNTRY = mV_COUNTRY;
	}

	public String getMV_RUNTIME() {
		return MV_RUNTIME;
	}

	public void setMV_RUNTIME(String mV_RUNTIME) {
		MV_RUNTIME = mV_RUNTIME;
	}

	public String getMV_RELEASE_DATE() {
		return MV_RELEASE_DATE;
	}

	public void setMV_RELEASE_DATE(String mV_RELEASE_DATE) {
		MV_RELEASE_DATE = mV_RELEASE_DATE;
	}

	public String getMV_ACTOR() {
		return MV_ACTOR;
	}

	public void setMV_ACTOR(String mV_ACTOR) {
		MV_ACTOR = mV_ACTOR;
	}

	public String getMV_DIRECTOR() {
		return MV_DIRECTOR;
	}

	public void setMV_DIRECTOR(String mV_DIRECTOR) {
		MV_DIRECTOR = mV_DIRECTOR;
	}

	public String getMV_GRADE() {
		return MV_GRADE;
	}

	public void setMV_GRADE(String mV_GRADE) {
		MV_GRADE = mV_GRADE;
	}

	public String getMV_STORY() {
		return MV_STORY;
	}

	public void setMV_STORY(String mV_STORY) {
		MV_STORY = mV_STORY;
	}

	@Override
	public String toString() {
		return "MovieDetailVo [MV_DETAIL_SEQ=" + MV_DETAIL_SEQ + ", MV_INFO_SEQ=" + MV_INFO_SEQ + ", MV_LINK=" + MV_LINK
				+ ", MV_TITLE=" + MV_TITLE + ", MV_GENRE=" + MV_GENRE + ", MV_COUNTRY=" + MV_COUNTRY + ", MV_RUNTIME="
				+ MV_RUNTIME + ", MV_RELEASE_DATE=" + MV_RELEASE_DATE + ", MV_ACTOR=" + MV_ACTOR + ", MV_DIRECTOR="
				+ MV_DIRECTOR + ", MV_GRADE=" + MV_GRADE + ", MV_STORY=" + MV_STORY + "]";
	}
	
}
