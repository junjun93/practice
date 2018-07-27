package com.tz.servlet.entity;

public class UserInfo {
	
	private Integer userId;
	private String userName;
	private Integer userAge;
	private String userSex;
	private String phone;
	private String email;
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public UserInfo() {
		// TODO Auto-generated constructor stub
	}
	public UserInfo(Integer userId, String userName, Integer userAge, String userSex, String phone, String email) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userAge = userAge;
		this.userSex = userSex;
		this.phone = phone;
		this.email = email;
	}
	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", userName=" + userName + ", userAge=" + userAge + ", userSex=" + userSex
				+ ", phone=" + phone + ", email=" + email + "]";
	}
	
	
}
