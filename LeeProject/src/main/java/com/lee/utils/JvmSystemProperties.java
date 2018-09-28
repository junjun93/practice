package com.lee.utils;

public class JvmSystemProperties {

//	获取系统属性
//	说明在值合理的情况下，file.encoding属性确实决定了所谓的默认编码
	public static String getEncoding(){
		return System.getProperty("file.encoding", "UTF-8");
	}
	
	public static void main(String[] args) {
		System.out.println(getEncoding());
	}
}
