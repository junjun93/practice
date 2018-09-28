package com.tz.srevlet.demo.servlet;

import com.tz.srevlet.demo.entity.User;
import com.tz.srevlet.demo.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		/*
		 * 获得页面表单提交的登录信息,且把信息放到一个User对象中
		 */
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		User user = new User(null, email, password);
		
		
		UserService userService = new UserService();
		boolean result = userService.login(user);
		
		
		if(result) {
			//如果用户存在,跳转到操作主页面
			//request.getRequestDispatcher("/main.html").forward(request, response);
			List<User> list = userService.getUserList();  //拿到从数据库返回的数据 
			HttpSession session = request.getSession();
			session.setAttribute("userList", list);
			session.setAttribute("user", user);
			
			
			//判断是否要记住用户名密码
			if("remember".equals(remember)) {
				//把用户信息以cookie发送浏览器保存
				Cookie cookie1 = new Cookie("email", email);
				cookie1.setMaxAge(60*60*24*7);
				Cookie cookie2 = new Cookie("password", password);
				cookie2.setMaxAge(60*60*24*7);
				Cookie cookie3 = new Cookie("remember", remember);
				cookie3.setMaxAge(60*60*24*7);
				
				response.addCookie(cookie1);
				response.addCookie(cookie2);
				response.addCookie(cookie3);
			}else {
				//把浏览器上用户信息的cookie清除
				Cookie[] cookies = request.getCookies();
				String[] names = new String[] {"email", "password", "remember"};
				for(Cookie cookie : cookies) {
					String name = cookie.getName();
					//判断是否在names数组中匹配到值 
					if(Arrays.binarySearch(names, name) >= 0) {
						cookie.setMaxAge(0);
						//添加
						response.addCookie(cookie);
					}
				}
			}
			response.sendRedirect(request.getContextPath()+"/main.jsp");
		}else {
			//如果用户不存在,跳转到一个失败页面(或者返回登录页面提示错误信息)
			response.sendRedirect(request.getContextPath()+"/error.html");
		}
		
	}
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}