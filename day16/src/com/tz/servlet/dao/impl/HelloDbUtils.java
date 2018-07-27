package com.tz.servlet.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.tz.servlet.dao.UserInfoDao;
import com.tz.servlet.utils.JdbcUtil;

public class HelloDbUtils implements UserInfoDao{
	
	QueryRunner queryRunner = new QueryRunner();
	
	
	/**
	 * ��ѯ����һ������ --BeanHandler
	 */
	@Override
	public <T> T getUserInfo(Class<T> clazz, String sql, Object... params) {
		Connection conn = JdbcUtil.getConnection();
		T entityObj = null;
		try {
			entityObj = queryRunner.query(conn, sql, new BeanHandler<>(clazz), params);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, null, null);
		}
		return entityObj;
	}
	
	
	
	/**
	 * ��ѯ����һ������
	 */
	@Override
	public <T> List<T> getUserInfoList(Class<T> clazz, String sql, Object... params) {
		Connection conn = JdbcUtil.getConnection();
		List<T> list = new ArrayList<T>();
		try {
			list = queryRunner.query(conn, sql, new BeanListHandler<>(clazz), params);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, null, null);
		}
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * ����ʵ�����,�޸�,ɾ����������
	 */
	@Override
	public void update(String sql, Object... params) {
		Connection conn = JdbcUtil.getConnection();
		try {
			queryRunner.update(conn, sql, params);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(conn, null, null);
		}
	}
}
