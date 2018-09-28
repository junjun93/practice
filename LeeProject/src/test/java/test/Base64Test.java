package test;

import com.lee.utils.Base64Util;

public class Base64Test {

	public static void main(String[] args) {
		String s1 = Base64Util.getBase64("123");
		String s2 = Base64Util.getFromBase64(s1);
		String s3 = Base64Util.getFromBase64("123");
		System.out.println(s1);
		System.out.println(s2);
		System.out.println(s3);

	}

}
