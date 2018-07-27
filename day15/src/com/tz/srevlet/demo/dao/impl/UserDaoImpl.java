package com.tz.srevlet.demo.dao.impl;

import com.tz.srevlet.demo.dao.UserDao;
import com.tz.srevlet.demo.entity.User;
import com.tz.srevlet.demo.utils.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDaoImpl implements UserDao{
	
	
	/*
	 * 到数据查询是否存在该用户
	 */
	@Override
	public boolean login(User user) {
		
		boolean bool = false;
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		
		conn = JdbcUtil.getConnection();
		String sql = "select * from user where email=? and password=?";
		try {
			preparedStatement = conn.prepareStatement(sql);
			preparedStatement.setString(1, user.getEmail());
			preparedStatement.setString(2, user.getPassword());
			result = preparedStatement.executeQuery();
			if(result.next()) {
				bool = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bool;
	}

	/*
	 * 获得所有User列表,然后返回
	 */
	@Override
	public List<User> getUserList() {
		
		List<User> list = new ArrayList<User>();
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		
		conn = JdbcUtil.getConnection();
		String sql = "select * from user";
		try {
			preparedStatement = conn.prepareStatement(sql);
			result = preparedStatement.executeQuery();
			while(result.next()) {
				int id = result.getInt("id");
				String email = result.getString("email");
				String password = result.getString("password");
				list.add(  new User(id, email, password) );
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}













