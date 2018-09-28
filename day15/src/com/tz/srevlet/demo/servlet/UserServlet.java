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
		 * ���ҳ����ύ�ĵ�¼��Ϣ,�Ұ���Ϣ�ŵ�һ��User������
		 */
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		User user = new User(null, email, password);
		
		
		UserService userService = new UserService();
		boolean result = userService.login(user);
		
		
		if(result) {
			//����û�����,��ת��������ҳ��
			//request.getRequestDispatcher("/main.html").forward(request, response);
			List<User> list = userService.getUserList();  //�õ������ݿⷵ�ص����� 
			HttpSession session = request.getSession();
			session.setAttribute("userList", list);
			session.setAttribute("user", user);
			
			
			//�ж��Ƿ�Ҫ��ס�û�������
			if("remember".equals(remember)) {
				//���û���Ϣ��cookie�������������
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
				//����������û���Ϣ��cookie���
				Cookie[] cookies = request.getCookies();
				String[] names = new String[] {"email", "password", "remember"};
				for(Cookie cookie : cookies) {
					String name = cookie.getName();
					//�ж��Ƿ���names������ƥ�䵽ֵ 
					if(Arrays.binarySearch(names, name) >= 0) {
						cookie.setMaxAge(0);
						//���
						response.addCookie(cookie);
					}
				}
			}
			response.sendRedirect(request.getContextPath()+"/main.jsp");
		}else {
			//����û�������,��ת��һ��ʧ��ҳ��(���߷��ص�¼ҳ����ʾ������Ϣ)
			response.sendRedirect(request.getContextPath()+"/error.html");
		}
		
	}
	
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}
}