package com.lee.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


/**
 * HttpServletResponse帮助类
 */
public final class ResponseUtils {
	
	private static Log log = LogFactory.getLog(ResponseUtils.class);

	/**
	 * 发送文本。使用UTF-8编码。
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param text
	 *            发送的字符串
	 */
	public static void renderText(HttpServletResponse response, String text) {
//		text/plain：将文件设置为纯文本的形式，浏览器在获取到这种文件时并不会对其进行处理。（text/plain是以纯文本格式发送）
		render(response, "text/plain;charset="+JvmSystemProperties.getEncoding(), text);
	}

	/**
	 * 发送json。使用运行时编码。
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param text
	 *            发送的字符串
	 */
	public static void renderJson(HttpServletResponse response, String text) {
		render(response, "text/html;charset="+JvmSystemProperties.getEncoding(), text);
	}

	/**
	 * 发送xml。使用运行时编码。
	 * 
	 * @param response
	 *            HttpServletResponse
	 * @param text
	 *            发送的字符串
	 */
	public static void renderXml(HttpServletResponse response, String text) {
		render(response, "text/xml;charset="+JvmSystemProperties.getEncoding(), text);
	}
	
	public static void renderHtml(HttpServletResponse response, String text){
		render(response, "text/html;charset="+JvmSystemProperties.getEncoding(), text);
	}

	/**
	 * 发送内容。
	 * 
	 * @param response
	 * @param contentType
	 * @param text
	 */
	public static void render(HttpServletResponse response, String contentType,
			String text) {
		response.setContentType(contentType);
		response.setCharacterEncoding(JvmSystemProperties.getEncoding());
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		try {
			PrintWriter pw = response.getWriter();
			pw.write(text);
			pw.flush();
			//System.out.println(new java.util.Date()+"=================="+text);
		} catch (IOException e) {
			log.info(e.getMessage());
		}
	}
}
