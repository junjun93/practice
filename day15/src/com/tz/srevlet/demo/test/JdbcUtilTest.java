package com.tz.srevlet.demo.test;

import java.sql.Connection;

import org.junit.Test;

import com.tz.srevlet.demo.utils.JdbcUtil;

public class JdbcUtilTest {
	
	@Test
	public void testGetConnection() {
		Connection conn = JdbcUtil.getConnection();
		System.out.println(conn);
	}
	
}
