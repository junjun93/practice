package com.lee.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebBindingInitializer;
import org.springframework.web.context.request.WebRequest;
 
/**
 * 时间转换类
 */
public class CustomDate implements WebBindingInitializer{
 
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// TODO Auto-generated method stub
		//转换日期
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
}
