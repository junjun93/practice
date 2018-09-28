package com.lee.service;

import java.util.List;

import com.lee.bean.User;

public interface UserService {

	String addInfo(User addInfo);
	List<User> getAll();
	String delete(int id);
	User findById(int id);
	String updateById(User user);
	void createTable();
	User login(User user);
	User findByUsername(String username);
	Integer checkName(String username);
}
