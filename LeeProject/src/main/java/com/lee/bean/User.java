package com.lee.bean;

import java.io.Serializable;
import java.util.Date;

public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String username ;
	private String password;
	private String tel;
	private Integer gender;
	private Date createTime;
	private Date birthday;
	private Date lastLoginTime;
	private Date lastUpdateTime;
	private String email;
	private String address;
	private String job;
	private String photoURL;
	private String school;
	private String qq;
	private String company;
	private String country;
	private String info;

	
	public User(Integer id, String username, String password, String tel, Integer gender, Date createTime,
			Date birthday, Date lastLoginTime, Date lastUpdateTime, String email, String address, String job,
			String photoURL, String school, String qq, String company, String country, String info) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.tel = tel;
		this.gender = gender;
		this.createTime = createTime;
		this.birthday = birthday;
		this.lastLoginTime = lastLoginTime;
		this.lastUpdateTime = lastUpdateTime;
		this.email = email;
		this.address = address;
		this.job = job;
		this.photoURL = photoURL;
		this.school = school;
		this.qq = qq;
		this.company = company;
		this.country = country;
		this.info = info;
	}


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getTel() {
		return tel;
	}


	public void setTel(String tel) {
		this.tel = tel;
	}


	public Integer getGender() {
		return gender;
	}


	public void setGender(Integer gender) {
		this.gender = gender;
	}


	public Date getCreateTime() {
		return createTime;
	}


	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}


	public Date getBirthday() {
		return birthday;
	}


	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public Date getLastLoginTime() {
		return lastLoginTime;
	}


	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}


	public Date getLastUpdateTime() {
		return lastUpdateTime;
	}


	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getJob() {
		return job;
	}


	public void setJob(String job) {
		this.job = job;
	}


	public String getPhotoURL() {
		return photoURL;
	}


	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}


	public String getSchool() {
		return school;
	}


	public void setSchool(String school) {
		this.school = school;
	}


	public String getQq() {
		return qq;
	}


	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getCompany() {
		return company;
	}


	public void setCompany(String company) {
		this.company = company;
	}


	public String getCountry() {
		return country;
	}


	public void setCountry(String country) {
		this.country = country;
	}


	public String getInfo() {
		return info;
	}


	public void setInfo(String info) {
		this.info = info;
	}


	public User() {
		super();
	}
	
}
