package com.tz.servlet.dao;

import java.util.List;

public interface UserInfoDao {
	
	/**
	 * 添加用户信息
	 * public void addUserInfo(UserInfo user);
	 * 
	 * 修改用户信息
	 * public void modifyUserInfo(UserInfo user);
	 * 
	 * 删除用户信息
	 * public void delUserInfo(Integer userId);
	 */
	
	
	/**
	 * 查询返回一条数据 
	 */
    <T> T getUserInfo(Class<T> clazz, String sql, Object... params);
	
	
	/**
	 * 查询返回一个集合
	 */
    <T> List<T> getUserInfoList(Class<T> clazz, String sql, Object... params);

	
	
	/**
	 * 可以实现添加,修改,删除三个操作
	 */
    void update(String sql, Object... params);
	
	
}
