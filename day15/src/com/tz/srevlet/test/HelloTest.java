package com.tz.srevlet.test;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

public class HelloTest {
	
	@BeforeClass
	public static void beforeInit() {
		System.out.println("���Ի��������Ѿ�׼��");
	}
	
	@Test
	public void testHello() {
		System.out.println("���ԵĴ���");
	}
	
	@Test
	public void testGetMax() {
		System.out.println("testGetMax....");
	}
	
	@AfterClass
	public static void afterDestroy() {
		System.out.println("���Ի��������� ");
	}
}


