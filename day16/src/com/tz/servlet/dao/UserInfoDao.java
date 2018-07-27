package com.tz.servlet.dao;

import java.util.List;

public interface UserInfoDao {
	
	/**
	 * ����û���Ϣ
	 * public void addUserInfo(UserInfo user);
	 * 
	 * �޸��û���Ϣ
	 * public void modifyUserInfo(UserInfo user);
	 * 
	 * ɾ���û���Ϣ
	 * public void delUserInfo(Integer userId);
	 */
	
	
	/**
	 * ��ѯ����һ������ 
	 */
	public <T> T getUserInfo(Class<T> clazz, String sql, Object...params);
	
	
	/**
	 * ��ѯ����һ������
	 */
	public <T> List<T> getUserInfoList(Class<T> clazz, String sql, Object...params);

	
	
	/**
	 * ����ʵ�����,�޸�,ɾ����������
	 */
	public void update(String sql, Object ...params);
	
	
}
