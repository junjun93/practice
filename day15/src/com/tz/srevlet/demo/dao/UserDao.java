package com.tz.srevlet.demo.dao;

import java.util.List;

import com.tz.srevlet.demo.entity.User;

public interface UserDao {
	
	/*
	 * �ж��Ƿ���ڸ��û�
	 */
    boolean login(User user);
	
	/*
	 * ��ȡ�û���Ϣ
	 */
    List<User> getUserList();
	
}
