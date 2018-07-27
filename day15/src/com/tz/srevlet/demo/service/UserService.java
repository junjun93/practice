package com.tz.srevlet.demo.service;

import java.util.List;

import com.tz.srevlet.demo.dao.impl.UserDaoImpl;
import com.tz.srevlet.demo.entity.User;

public class UserService {
	
	UserDaoImpl userDaoImpl = new UserDaoImpl();
	
	public boolean login(User user) {
		boolean result =  userDaoImpl.login(user);
		return result;
	}
	
	public List<User> getUserList() {
		List<User> list = userDaoImpl.getUserList();
		return list;
	}
	
}
