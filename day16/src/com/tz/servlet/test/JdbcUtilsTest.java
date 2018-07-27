package com.tz.servlet.test;

import java.sql.Connection;
import org.junit.Test;
import com.tz.servlet.utils.JdbcUtil;

public class JdbcUtilsTest {
	
	@Test
	public void testGetConnection() {
		Connection conn = JdbcUtil.getConnection();
		System.out.println(conn);
	}
	
}
