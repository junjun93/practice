package com.tz.srevlet.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class HelloTest {
	
	@BeforeClass
	public static void beforeInit() {
		System.out.println("测试环境代码已经准备");
	}
	
	@Test
	public void testHello() {
		System.out.println("测试的代码");
	}
	
	@Test
	public void testGetMax() {
		System.out.println("testGetMax....");
	}
	
	@AfterClass
	public static void afterDestroy() {
		System.out.println("测试环境被销毁 ");
	}
}


