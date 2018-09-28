package com.lee.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lee.bean.PersonalSetting;

@Controller
@RequestMapping("/setting")
public class SettingController {

	@RequestMapping("settingIndex")
	public String settingIndex() {
		return "setting/settingIndex";
	}
	
	@RequestMapping("settingTheme")
	public String settingTheme() {
		return "setting/settingTheme";
	}

	@RequestMapping("/setting")
	public void setting(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String font = request.getParameter("font");
		String theme = request.getParameter("theme");
		System.out.println(font+"____________________________________");
		System.out.println(theme+"____________________________________");
		PersonalSetting ps=(PersonalSetting)session.getAttribute("ps");
		if (ps==null) {
			ps = new PersonalSetting();
		}
		System.err.println(ps);
		if (font!=null) {
			ps.setFont(font);
		}
		if (theme!=null) {
			ps.setTheme(theme);
		}
		session.setAttribute("ps", ps);
	}
//	@RequestMapping("/settingFont")
//	public void settingFont(HttpServletRequest request, HttpServletResponse response) {
//		Map<String, Object> result = new HashMap<String, Object>();
//		String webRoot = request.getSession().getServletContext().getRealPath("/");
//		String selectiveFont = request.getParameter("selectiveFont");
//		System.out.println("————————————————————————"+selectiveFont);
//		String replace = "*{font-family: '" + selectiveFont + "', Serif;}";
//		if ("reset".equals(selectiveFont)) {
//			replace="";
//		}
//		String filePath = webRoot + "/css/public.css";
//		BufferedReader br = null;
//		String line = null;
//		StringBuffer buf = new StringBuffer();
//		try {
//			// 根据文件路径创建缓冲输入流
//			br = new BufferedReader(new FileReader(filePath));
//			// 循环读取文件的每一行, 对需要修改的行进行修改, 放入缓冲对象中
//			while ((line = br.readLine()) != null) {
//				if (line.indexOf("*{font-family") != -1) {
//					line = replace;
//				}
//				buf.append(line + "\r\n");
//			}
//		} catch (Exception e) {
//			result.put("status", "error");
//			result.put("info", e.getCause());
//			e.printStackTrace();
//		} finally {
//			// 关闭流
//			if (br != null) {
//				try {
//					br.close();
//				} catch (IOException e) {
//					br = null;
//				}
//			}
//		}
//
//		BufferedWriter bw = null;
//
//		try {
//			// 根据文件路径创建缓冲输出流
//			bw = new BufferedWriter(new FileWriter(filePath));
//			// 将内容写入文件中
//			bw.write(buf.toString());
//			result.put("status", "ok");
//		} catch (Exception e) {
//			result.put("status", "error");
//			result.put("info", e.getCause());
//			e.printStackTrace();
//		} finally {
//			// 关闭流
//			if (bw != null) {
//				try {
//					bw.close();
//				} catch (IOException e) {
//					bw = null;
//				}
//			}
//		}
//		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
//	}
	
	
}
