package com.army.movieEro.member.vo;

public class MemberVO {
	private String mb_id;
	private String mb_passwd;
	private String mb_name;
	private String mb_mail;
	private String mb_maildomain;
	private String mb_phone;
	private String mb_group;
	
	public MemberVO() {}
	public MemberVO(String mb_id, String mb_passwd) {
		this.mb_id = mb_id;
		this.mb_passwd = mb_passwd;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_passwd() {
		return mb_passwd;
	}
	public void setMb_passwd(String mb_passwd) {
		this.mb_passwd = mb_passwd;
	}
	public String getMb_name() {
		return mb_name;
	}
	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}
	public String getMb_mail() {
		return mb_mail;
	}
	public void setMb_mail(String mb_mail) {
		this.mb_mail = mb_mail;
	}
	public String getMb_maildomain() {
		return mb_maildomain;
	}
	public void setMb_maildomain(String mb_maildomain) {
		this.mb_maildomain = mb_maildomain;
	}
	public String getMb_phone() {
		return mb_phone;
	}
	public void setMb_phone(String mb_phone) {
		this.mb_phone = mb_phone;
	}
	public String getMb_group() {
		return mb_group;
	}
	public void setMb_group(String mb_group) {
		this.mb_group = mb_group;
	}

}
