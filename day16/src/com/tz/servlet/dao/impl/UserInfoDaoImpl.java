package com.tz.servlet.dao.impl;

import com.tz.servlet.dao.UserInfoDao;
import com.tz.servlet.utils.JdbcUtil;
import org.apache.commons.beanutils.BeanUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserInfoDaoImpl implements UserInfoDao{
	
	
	/**
	 * ��ѯ����һ������ 
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
			//�������
			for(int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			result = preparedStatement.executeQuery();
			//���÷��䴴��һ����Ӧ�Ķ���
			entityObj = clazz.newInstance();
			//�������ݴ��һ��ʵ������ȥ
			while(result.next()) {
				
				ResultSetMetaData resultSetMetaData = result.getMetaData();//��ȡ���result������еı�ţ����ͺ����Ե�
				//resultSetMetaData.getColumnCount(); �����ֶ���;
				for(int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					String columnLabel = resultSetMetaData.getColumnLabel(i+1);   //�����ֶ������߱���;
					System.out.println(columnLabel);
					Object columnValue = result.getObject(i+1);				      //��ȡ�ֶ�ֵ
					BeanUtils.setProperty(entityObj, columnLabel, columnValue);//��ʵ���������ֵ
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
	 * ��ѯ����һ������
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
			//�������
			for(int i = 0; i < params.length; i++) {
				preparedStatement.setObject(i+1, params[i]);
			}
			result = preparedStatement.executeQuery();
			//�������ݴ��һ��ʵ������ȥ
			while(result.next()) {
				
				//���÷��䴴��һ����Ӧ�Ķ���
				entityObj = clazz.newInstance();
				
				ResultSetMetaData resultSetMetaData = result.getMetaData();//��ȡ���result������еı�ţ����ͺ����Ե�
				//resultSetMetaData.getColumnCount(); �����ֶ���;
				for(int i = 0; i < resultSetMetaData.getColumnCount(); i++) {
					String columnLabel = resultSetMetaData.getColumnLabel(i+1);   //�����ֶ������߱���;
					System.out.println(columnLabel);
					Object columnValue = result.getObject(i+1);				      //��ȡ�ֶ�ֵ
					BeanUtils.setProperty(entityObj, columnLabel, columnValue);//��ʵ���������ֵ
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
	 * ����ʵ�����,�޸�,ɾ����������
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
	 * ����û���Ϣ
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
		//�޸��û���Ϣ
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
		//ɾ���û���Ϣ
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
