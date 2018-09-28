package com.lee.dao;

import java.util.List;

import com.lee.bean.User;

/**
 * 对用户管理模块的持久层完成数据库的操作
 * 
 * @author Lee
 *
 */

public interface UserMapper {

	Integer insert(User user);

	Integer insertSelective(User user);

	Integer deleteByPrimaryKey(Integer id);

	Integer updateByid(User user);

	Integer updateByPrimaryKey(User user);
	void createTable();

	User selectByPrimaryKey(Integer id);

	List<User> getAll();

	User selectByUsernameAndPassword(User user);
	
	User selectByUsername(String username);

	Integer checkName(String username);
}
