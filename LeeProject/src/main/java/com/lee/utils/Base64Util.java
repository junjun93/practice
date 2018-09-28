package com.lee.utils;

import java.io.UnsupportedEncodingException;

import org.apache.commons.codec.binary.Base64;
import org.junit.Test;
import org.springframework.util.StringUtils;
/**
 * Base64工具类
 * @author Lee
 */
public class Base64Util {

	// 加密
	public static String getBase64(String str) {
		byte[] b = null;
		String s = null;
		try {
			if (StringUtils.isEmpty(str)) {
				return s;
			}
			b = str.getBytes("utf-8");
			if (b != null) {
				s = Base64.encodeBase64String(b);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return s;
	}

	// 解密
	public static String getFromBase64(String s) {
		byte[] b = null;
		String result = null;
		if (s != null) {
			try {
				b = Base64.decodeBase64(s);
				result = new String(b, "utf-8");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	//@Test
	//
	//public void test1() {
	//	System.out.println(getBase64("123"));
	//}
	}
