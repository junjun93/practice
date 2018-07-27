package com.tz.srevlet.demo.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebFilter(
//	urlPatterns = "/jsp/a.jsp",
//	initParams = {
//		@WebInitParam(name="user", value="–°∫Ï√√√√"),
//		@WebInitParam(name="password", value="123")
//	}
//)
public class HelloFilter extends SuperFilter{
	
	@Override
	public void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		System.out.println("123");
		
		chain.doFilter(request, response);
		
	}
	
}
