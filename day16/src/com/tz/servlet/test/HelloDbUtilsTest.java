package com.tz.servlet.test;

import java.util.List;

import org.junit.Test;

import com.tz.servlet.dao.impl.HelloDbUtils;
import com.tz.servlet.entity.UserInfo;

public class HelloDbUtilsTest {	
	
	HelloDbUtils helloDbUtils = new HelloDbUtils();
	
	/**
	 * ��ѯ����һ������
	 */
	@Test
	public void testGetUserInfoList() {
		String str = "user_id userId, user_name userName, user_age userAge, user_sex userSex,phone,email";
		String sql = "select "+str+" from user_info";
		List<UserInfo> list = helloDbUtils.getUserInfoList(UserInfo.class, sql);
		System.out.println(list);
	}
	
	
	/**
	 * ��ѯ����һ������ --BeanHandler
	 */
	@Test
	public void testGetUserInfo() {
		String str = "user_id userId, user_name userName, user_age userAge, user_sex userSex,phone,email";
		String sql = "select "+str+" from user_info where user_id = ?";
		UserInfo userInfo = helloDbUtils.getUserInfo(UserInfo.class, sql, 1);
		System.out.println(userInfo);
	}
	
	
	/**
	 * ����ʵ�����,�޸�,ɾ����������
	 */
	@Test
	public void testUpdate() {
		UserInfo user = new UserInfo(5, "С��", 18, "Ů", "13778966578", "13778966578@qq.com");
		String sql = "insert into user_info values(?,?,?,?,?,?)";
		helloDbUtils.update(sql, user.getUserId(), user.getUserName(),
				user.getUserAge(), user.getUserSex(),user.getPhone(), user.getEmail());
	}
	
}
