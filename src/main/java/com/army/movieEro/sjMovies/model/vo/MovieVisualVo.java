package com.army.movieEro.sjMovies.model.vo;

public class MovieVisualVo {
	private int MV_STILLCUT_SEQ;
	private int MV_TRAILER_SEQ;
	private int MV_INFO_SEQ;
	private String MV_TITLE;
	private String MV_STILLCUT;
	private String MV_TRAILER;
	private String MV_DESC;
	
	public MovieVisualVo() {}

	public MovieVisualVo(int mV_STILLCUT_SEQ, int mV_TRAILER_SEQ, int mV_INFO_SEQ, String mV_TITLE, String mV_STILLCUT,
			String mV_TRAILER, String mV_DESC) {
		super();
		MV_STILLCUT_SEQ = mV_STILLCUT_SEQ;
		MV_TRAILER_SEQ = mV_TRAILER_SEQ;
		MV_INFO_SEQ = mV_INFO_SEQ;
		MV_TITLE = mV_TITLE;
		MV_STILLCUT = mV_STILLCUT;
		MV_TRAILER = mV_TRAILER;
		MV_DESC = mV_DESC;
	}

	public int getMV_STILLCUT_SEQ() {
		return MV_STILLCUT_SEQ;
	}

	public void setMV_STILLCUT_SEQ(int mV_STILLCUT_SEQ) {
		MV_STILLCUT_SEQ = mV_STILLCUT_SEQ;
	}

	public int getMV_TRAILER_SEQ() {
		return MV_TRAILER_SEQ;
	}

	public void setMV_TRAILER_SEQ(int mV_TRAILER_SEQ) {
		MV_TRAILER_SEQ = mV_TRAILER_SEQ;
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

	public String getMV_STILLCUT() {
		return MV_STILLCUT;
	}

	public void setMV_STILLCUT(String mV_STILLCUT) {
		MV_STILLCUT = mV_STILLCUT;
	}

	public String getMV_TRAILER() {
		return MV_TRAILER;
	}

	public void setMV_TRAILER(String mV_TRAILER) {
		MV_TRAILER = mV_TRAILER;
	}

	public String getMV_DESC() {
		return MV_DESC;
	}

	public void setMV_DESC(String mV_DESC) {
		MV_DESC = mV_DESC;
	}

	@Override
	public String toString() {
		return "MovieVisualVo [MV_STILLCUT_SEQ=" + MV_STILLCUT_SEQ + ", MV_TRAILER_SEQ=" + MV_TRAILER_SEQ
				+ ", MV_INFO_SEQ=" + MV_INFO_SEQ + ", MV_TITLE=" + MV_TITLE + ", MV_STILLCUT=" + MV_STILLCUT
				+ ", MV_TRAILER=" + MV_TRAILER + ", MV_DESC=" + MV_DESC + "]";
	}
}
