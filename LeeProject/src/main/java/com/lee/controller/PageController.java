package com.lee.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


public class PageController {
	
	// 打开首页
	@RequestMapping("/")
	public String pageIndex(HttpSession session, HttpServletRequest request) {
		String webRoot = request.getSession().getServletContext().getRealPath("/");
		if (webRoot == null) {
			webRoot = this.getClass().getClassLoader().getResource("/").getPath();
			webRoot = webRoot.substring(0, webRoot.indexOf("WEB-INF"));
		}
		List<String> list = null;
		File file = new File(webRoot + "/img/photos");
		if (file.exists()) {
			File[] photos = file.listFiles();
			list = new ArrayList<String>();
			for (File files : photos) {
				list.add(files.getName());
			}
		} else {
			System.out.println("找不到文件——————————————————");
		}
//		System.out.println(list);
		session.setAttribute("list", list);
		return "index";
	}
	
}