package com.tz.srevlet.demo.test;

import java.util.List;

import org.junit.Test;

import com.tz.srevlet.demo.dao.impl.UserDaoImpl;
import com.tz.srevlet.demo.entity.User;

public class UserDaoImplTest {
	
	@Test
	public void testLogin() {
		
		User user = new User(null, "123@qq.com", "123456");
		
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		boolean bool = userDaoImpl.login(user);
		System.out.println(bool);
		
	}
	
	@Test
	public void testGetUserList() {
		UserDaoImpl userDaoImpl = new UserDaoImpl();
		List<User> list = userDaoImpl.getUserList();
		System.out.println(list);
	}
	
	
}
