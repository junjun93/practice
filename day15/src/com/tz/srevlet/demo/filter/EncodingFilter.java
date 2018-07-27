package com.tz.srevlet.demo.filter;
	
import java.io.IOException;
	
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javafx.collections.ListChangeListener.Change;
	
@WebFilter("/*")
public class EncodingFilter extends SuperFilter{
	
	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//自己先写一个可以处理编码的request对象
		if(request.getMethod().equalsIgnoreCase("GET")) {
			MyEncodingRequest req = new MyEncodingRequest(request);
			chain.doFilter(req, response);
		}else if(request.getMethod().equalsIgnoreCase("POST")){
			request.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);
		}
		
		//然后把自己写的这个对象传入到servlet中
	}
}
