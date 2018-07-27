package com.tz.srevlet.test;

import org.junit.Assert;
import org.junit.Test;

public class MathUtilTest {
	
	@Test
	public void testGetMaxValue() {
		
		MathUtil mu = new MathUtil();
		//System.out.println(mu.getMaxValue(5, 10));
		
		//断言
		//Assert.assertSame(10, mu.getMaxValue(5, 10)); 使用==比较
		//Assert.assertSame(new String("小红"), "小红");   
		
		//Assert.assertEquals(new String("小红"), "小红");   //使用equals比较
		
		int[] a = new int[] {1,2,3};
		int[] b = new int[] {1,2,3};
		
//		Assert.assertArrayEquals(a, b);
		
		System.out.println("testGetMaxValue.....");
		
		String value = null;
		Assert.assertNull(value);
		
	}
	
	@Test
	public void test4() {
		System.out.println("test4.....");
	}
	
	
}



