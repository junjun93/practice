package com.tz.servlet.test;

import java.lang.reflect.InvocationTargetException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;
import org.junit.Test;

import com.tz.servlet.dao.impl.UserInfoDaoImpl;
import com.tz.servlet.entity.User;
import com.tz.servlet.entity.UserInfo;

public class UserInfoDaoImplTest {

	UserInfoDaoImpl userInfoDaoImpl = new UserInfoDaoImpl();
	
	
	
	/**
	 * ��ѯ����һ������
	 */
	@Test
	public void testGetUserInfoList() {
		String sql = "select * from user";
		List<User> list = userInfoDaoImpl.getUserInfoList(User.class, sql);
		System.out.println(list);
	}
	
	/**
	 * ���Բ�ѯ����һ������ 
	 */
	@Test
	public void testGetUserInfo() {
		//String str = "user_id userId, user_name userName, user_age userAge, user_sex userSex,phone,email";
		//String sql = "select "+str+" from user_info where user_id = ?";
		//UserInfo userInfo = userInfoDaoImpl.getUserInfo(UserInfo.class, sql, 1);
		//System.out.println(userInfo);
		
		//String sql = "select * from user where id = ?";
		//User user = userInfoDaoImpl.getUserInfo(User.class, sql, 1);
		//System.out.println(user);
	}
	
	@Test
	public void test1() {
		UserInfo user = new UserInfo(5, "С��", 18, "Ů", "13778966578", "13778966578@qq.com");
		try {
			BeanUtils.setProperty(user, "user_name", "СС��");
			System.out.println(user);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	
	
	/*
	 * ������ɾ�Ĳ���
	 */
	@Test
	public void update() {
		// UserInfo user = new UserInfo(5, "С��", 18, "Ů", "13778966578",
		// "13778966578@qq.com");
		// String sql = "insert into user_info values(?,?,?,?,?,?)";
		// userInfoDaoImpl.update(sql, user.getUserId(), user.getUserName(),
		// user.getUserAge(), user.getUserSex(),user.getPhone(), user.getEmail());
		
		//UserInfo user = new UserInfo(5, "СС��", 16, "Ů", "13778966578", "13778966578@qq.com");
		//String sql = "update user_info set user_name=?,user_age=?,user_sex=?,phone=?,email=? where user_id=?";
		//userInfoDaoImpl.update(sql, user.getUserName(),
		//user.getUserAge(), user.getUserSex(),user.getPhone(), user.getEmail(), user.getUserId());
		
		String sql = "delete from user_info where user_id=?";
		userInfoDaoImpl.update(sql, 5);
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * @Test public void testAddUserInfo() { UserInfo user = new UserInfo(5, "С��",
	 * 18, "Ů", "13778966578", "13778966578@qq.com");
	 * userInfoDaoImpl.addUserInfo(user); }
	 * 
	 * @Test public void testModifyUserInfo() { UserInfo user = new UserInfo(5,
	 * "С����", 16, "Ů", "13778966578", "13778966578@qq.com");
	 * userInfoDaoImpl.modifyUserInfo(user); }
	 * 
	 * @Test public void testDelUserInfo() { userInfoDaoImpl.delUserInfo(5); }
	 */

}
