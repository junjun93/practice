package com.tz.servlet.dao.impl;

import com.tz.servlet.dao.UserInfoDao;
import com.tz.servlet.utils.JdbcUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDaoImpl implements UserInfoDao{
	
	
	/**
	 * 查询返回一条数据 
	 */
	@Override
	public <T> T getUserInfo(Class<T> clazz, String sql, Object... params) {
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		T entityObj = null;
		
		try {
			conn = JdbcUtil.getConnection();
			preparedStatement = conn.prepareStatement(sql);
			//填充数据
			for(int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			result = preparedStatement.executeQuery();
			//利用反射创建一个相应的对象
			entityObj = clazz.newInstance();
			//遍历数据存放一个实体类里去
			while(result.next()) {
				
				ResultSetMetaData resultSetMetaData = result.getMetaData();//获取这个result对象的列的编号，类型和属性等
				//resultSetMetaData.getColumnCount(); 返回字段数;
				for(int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					String columnLabel = resultSetMetaData.getColumnLabel(i+1);   //返回字段名或者别名;
					System.out.println(columnLabel);
					Object columnValue = result.getObject(i+1);				      //获取字段值
					BeanUtils.setProperty(entityObj, columnLabel, columnValue);//给实体对象属性值
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, preparedStatement, result);
		}
		return entityObj;
	}
	
	/**
	 * 查询返回一个集合
	 */
	@Override
	public <T> List<T> getUserInfoList(Class<T> clazz, String sql, Object... params) {
		
		Connection conn = null;
		PreparedStatement preparedStatement = null;
		ResultSet result = null;
		T entityObj = null;
		List<T> list = new ArrayList<T>();
		
		try {
			conn = JdbcUtil.getConnection();
			preparedStatement = conn.prepareStatement(sql);
			//填充数据
			for(int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			result = preparedStatement.executeQuery();
			//遍历数据存放一个实体类里去
			while(result.next()) {
				
				//利用反射创建一个相应的对象
				entityObj = clazz.newInstance();
				
				ResultSetMetaData resultSetMetaData = result.getMetaData();//获取这个result对象的列的编号，类型和属性等
				//resultSetMetaData.getColumnCount(); 返回字段数;
				for(int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					String columnLabel = resultSetMetaData.getColumnLabel(i+1);   //返回字段名或者别名;
					System.out.println(columnLabel);
					Object columnValue = result.getObject(i+1);				      //获取字段值
					BeanUtils.setProperty(entityObj, columnLabel, columnValue);//给实体对象属性值
				}
				list.add(entityObj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, preparedStatement, result);
		}		
		return list;
	}
	
	/**
	 * 可以实现添加,修改,删除三个操作
	 */
	@Override
	public void update(String sql, Object... params) {
		Connection conn = JdbcUtil.getConnection();
		PreparedStatement preparedStatement = null;
		//String sql = "insert into user_info values(?,?,?,?,?,?)";
		try {
			preparedStatement = conn.prepareStatement(sql);
			for(int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, preparedStatement, null);
		}
	}
	
	
	
	
	
	/**
	 * 添加用户信息
		@Override
		public void addUserInfo(UserInfo user) {
			Connection conn = JdbcUtil.getConnection();
			PreparedStatement preparedStatement = null;
			String sql = "insert into user_info values(?,?,?,?,?,?)";
			try {
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, user.getUserId());
				preparedStatement.setString(2, user.getUserName());
				preparedStatement.setInt(3, user.getUserAge());
				preparedStatement.setString(4, user.getUserSex());
				preparedStatement.setString(5, user.getPhone());
				preparedStatement.setString(6, user.getEmail());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, preparedStatement, null);
			}
		}
		//修改用户信息
		@Override
		public void modifyUserInfo(UserInfo user) {
			Connection conn = JdbcUtil.getConnection();
			PreparedStatement preparedStatement = null;
			String sql = "update user_info set user_name=?,user_age=?,user_sex=?,phone=?,email=? where user_id=?";
			try {
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setString(1, user.getUserName());
				preparedStatement.setInt(2, user.getUserAge());
				preparedStatement.setString(3, user.getUserSex());
				preparedStatement.setString(4, user.getPhone());
				preparedStatement.setString(5, user.getEmail());
				preparedStatement.setInt(6, user.getUserId());
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, preparedStatement, null);
			}
		}
		//删除用户信息
		@Override
		public void delUserInfo(Integer userId) {
			Connection conn = JdbcUtil.getConnection();
			PreparedStatement preparedStatement = null;
			String sql = "delete from user_info where user_id = ?";
			try {
				preparedStatement = conn.prepareStatement(sql);
				preparedStatement.setInt(1, userId);
				
				preparedStatement.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JdbcUtil.close(conn, preparedStatement, null);
			}
		}
	 */
	

}
