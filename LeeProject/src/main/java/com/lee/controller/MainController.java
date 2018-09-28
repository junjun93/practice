package com.lee.controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.font.FontRenderContext;
import java.awt.geom.Rectangle2D;
import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lee.utils.JSONUtil;
import com.lee.utils.ResponseUtils;


@Controller
@RequestMapping("/main")
public class MainController {


	@RequestMapping("/getPhotos")
	public void getPhotos(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String webRoot = request.getSession().getServletContext().getRealPath("/");
		if (webRoot == null) {
			webRoot = this.getClass().getClassLoader().getResource("/").getPath();
			webRoot = webRoot.substring(0, webRoot.indexOf("WEB-INF"));
		}
		List<String> list = null;
		File file = new File(webRoot + "/static/img/photos");
		if (file.exists()) {
			File[] photos = file.listFiles();
			list = new ArrayList<String>();
			for (File files : photos) {
				list.add(files.getName());
			}
		} else {
			System.out.println("找不到文件——————————————————");
		}
		// System.out.println(list);
		session.setAttribute("list", list);
	}

	

	


	/**
	 * 获取验证码
	 * 
	 * @param response
	 * @param session
	 */
	@RequestMapping("/getVerifyCode")
	public void generate(HttpServletResponse response, HttpSession session) {
		ByteArrayOutputStream output = new ByteArrayOutputStream();
		String verifyCodeValue = drawImg(output);
		// 将验证码存入session
		session.setAttribute("verifyCodeValue", verifyCodeValue);
		try {
			ServletOutputStream out = response.getOutputStream();
			output.writeTo(out);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 绘画验证码
	 * 
	 * @param output
	 * @return
	 */
	private String drawImg(ByteArrayOutputStream output) {
		String code = "";
		// 随机产生4个字符
		for (int i = 0; i < 4; i++) {
			code += randomChar();
		}
		int width = 70;
		int height = 25;
		BufferedImage bi = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
		Font font = new Font("Times New Roman", Font.PLAIN, 20);
		// 调用Graphics2D绘画验证码
		Graphics2D g = bi.createGraphics();
		g.setFont(font);
		Color color = new Color(66, 2, 82);
		g.setColor(color);
		g.setBackground(new Color(226, 226, 240));
		g.clearRect(0, 0, width, height);
		FontRenderContext context = g.getFontRenderContext();
		Rectangle2D bounds = font.getStringBounds(code, context);
		double x = (width - bounds.getWidth()) / 2;
		double y = (height - bounds.getHeight()) / 2;
		double ascent = bounds.getY();
		double baseY = y - ascent;
		g.drawString(code, (int) x, (int) baseY);
		g.dispose();
		try {
			ImageIO.write(bi, "jpg", output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return code;
	}

	/**
	 * 随机参数一个字符
	 * 
	 * @return
	 */
	private char randomChar() {
		Random r = new Random();
		String s = "ABCDEFGHJKLMNPRSTUVWXYZ0123456789";
		return s.charAt(r.nextInt(s.length()));
	}

	@RequestMapping("/startQQ")
	public void startQQ(HttpServletResponse response, HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		String command = "cmd /c start tencent://message/?uin=843416545";
		Runtime runtime = Runtime.getRuntime();
		try {
			Process process = runtime.exec(command);
			// result.put("status", "ok");
			// result.put("info", "启动QQ成功");
		} catch (IOException e) {
			e.printStackTrace();
			result.put("status", "error");
			result.put("info", "启动QQ失败！具体异常信息：" + e.getCause());
		}
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	
    
}
