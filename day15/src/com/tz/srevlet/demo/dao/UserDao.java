package com.tz.srevlet.demo.dao;

import java.util.List;

import com.tz.srevlet.demo.entity.User;

public interface UserDao {
	
	/*
	 * 判断是否存在该用户
	 */
	public boolean login(User user);
	
	/*
	 * 获取用户信息
	 */
	public List<User> getUserList();
	
}
