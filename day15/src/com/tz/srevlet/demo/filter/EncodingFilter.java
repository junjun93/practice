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
		
		//�Լ���дһ�����Դ�������request����
		if(request.getMethod().equalsIgnoreCase("GET")) {
			MyEncodingRequest req = new MyEncodingRequest(request);
			chain.doFilter(req, response);
		}else if(request.getMethod().equalsIgnoreCase("POST")){
			request.setCharacterEncoding("UTF-8");
			chain.doFilter(request, response);
		}
		
		//Ȼ����Լ�д����������뵽servlet��
	}
}
