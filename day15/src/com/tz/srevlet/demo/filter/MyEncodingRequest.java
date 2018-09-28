package com.tz.srevlet.demo.filter;

import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyEncodingRequest extends HttpServletRequestWrapper{
	
	private HttpServletRequest request;
	
	public MyEncodingRequest(HttpServletRequest request) {
		super(request);
		this.request = request;
	}
	
	@Override
	public String getParameter(String name) {
		String value = request.getParameter(name);
        value = new String(value.getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
        return value;
	}
	
}
