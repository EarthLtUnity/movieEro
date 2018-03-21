package com.army.movieEro.member.vo;

public class MemberVO {
	private String id;
	private String passwd;
	private String name;
	private String mail;
	private String maildomain;
	private String phone;
	private String group;
	
	public MemberVO() {}
	public MemberVO(String id, String passwd) {
		this.id = id;
		this.passwd = passwd;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMaildomain() {
		return maildomain;
	}
	public void setMaildomain(String maildomain) {
		this.maildomain = maildomain;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}

}
