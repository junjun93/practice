package com.tz.srevlet.test;

import org.junit.Assert;
import org.junit.Test;

public class MathUtilTest {
	
	@Test
	public void testGetMaxValue() {
		
		MathUtil mu = new MathUtil();
		//System.out.println(mu.getMaxValue(5, 10));
		
		//����
		//Assert.assertSame(10, mu.getMaxValue(5, 10)); ʹ��==�Ƚ�
		//Assert.assertSame(new String("С��"), "С��");   
		
		//Assert.assertEquals(new String("С��"), "С��");   //ʹ��equals�Ƚ�
		
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



