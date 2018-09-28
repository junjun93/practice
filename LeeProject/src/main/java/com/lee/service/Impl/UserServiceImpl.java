package com.lee.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lee.bean.User;
import com.lee.dao.UserMapper;
import com.lee.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
    private UserMapper userDao;
	public UserMapper getUserDao() {
		return userDao;
	}
	public void setUserDao(UserMapper userDao) {
		this.userDao = userDao;
	}
	
	//表示一个方法声明的目的是覆盖父类方法声明。如果一个方法是注释，该注释类型但不重写基类方法，编译器必须生成一个错误消息。
	public String addInfo(User addInfo) {
		if (userDao.insertSelective(addInfo) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}
	
	public List<User> getAll() {
		return userDao.getAll();
	}
	public String delete(int id) {
		if (userDao.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}
	
	public User findById(int id) {
		return userDao.selectByPrimaryKey(id);
	}
	
	public String updateById(User user) {
		if (userDao.updateByid(user) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}
	
	
	public User login(User user) {
		return userDao.selectByUsernameAndPassword(user);
	}
	
	public User findByUsername(String username) {
		return userDao.selectByUsername(username);
	}
	
	public Integer checkName(String username) {
		return userDao.checkName(username);
	}
	
	
	public void createTable() {
		userDao.createTable();
	}
}