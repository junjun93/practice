package com.lee.utils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;

public class JSONUtil {

	@JSONField(format = "yyyy-MM-dd HH:mm")
	private Date createTime = new Date();
	
	
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	public static String object2String(Object obj,SerializeConfig mapping){
		return JSON.toJSONString(obj, mapping);
	}

	public static String object2String(Object obj){
		SerializeConfig mapping = new SerializeConfig();
		mapping.put(java.util.Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		mapping.put(java.sql.Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		mapping.put(java.sql.Timestamp.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		return JSON.toJSONString(obj,mapping);
	}
	
	public static Map<String,String> string2Map(String str){
		Map<String,String> map = JSON.parseObject(str, Map.class);
		return map;
	}
	
	public static <T> T string2Object(Class<T> clazz,String str){
		return JSON.parseObject(str, clazz);
	}
	
	public static <T> List<T> string2ObjectArray(Class<T> clazz,String str){
		return JSON.parseArray(str, clazz);
	}
	
	public static JSONObject string2JSONObject(String jsonStr){
		return JSON.parseObject(jsonStr);
	}
	
	public static void testCollection(){
		System.out.println("======== testCollection() begin  ==========");
		List a = new ArrayList();
		a.add("na\"\"'[{bd}]me");
		a.add("[{}]");
		a.add(new Date());
		a.add(new java.sql.Timestamp(new Date().getTime()));
		JSONUtil util = new JSONUtil();
		a.add(util);
		SerializeConfig mapping = new SerializeConfig();
		mapping.put(Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd"));
		mapping.put(java.sql.Date.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		mapping.put(java.sql.Timestamp.class, new SimpleDateFormatSerializer("yyyy-MM-dd HH:mm:ss"));
		System.out.println(object2String(a,mapping));
		System.out.println(object2String("aa"));
		System.out.println("======== testCollection() end  ==========");
		String jsonStr = "{\"p1\":\"dddd\",\"p2\":\"ggg\"}";
		Map<String,String> map = JSON.parseObject(jsonStr, Map.class);
		System.out.println(map.values());
	}
	
	public static void main(String[] args) {
		testCollection();
	}
}
