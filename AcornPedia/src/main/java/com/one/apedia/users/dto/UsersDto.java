package com.one.apedia.users.dto;

public class UsersDto {
	//필드
	private String id;
	private String pwd;
	private String email;
	private String profile;
	private String regdate;
	private String newPwd;
	private int point;
	
	public UsersDto() {}
	
	public UsersDto(String id, String pwd, String email, String profile, String regdate, String newPwd, int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.profile = profile;
		this.regdate = regdate;
		this.newPwd = newPwd;
		this.point = point;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
}