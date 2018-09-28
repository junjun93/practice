package com.lee.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lee.bean.User;
import com.lee.service.UserService;
import com.lee.utils.Base64Util;
import com.lee.utils.JSONUtil;
import com.lee.utils.ResponseUtils;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {
	@Autowired
	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	/**
	 * 显示登录页面
	 * 
	 * @return view组件名
	 */
	@RequestMapping("/showLogin")
	public String showLogin() {
		return "user/login";
	}

	/**
	 * 显示注册页面
	 * 
	 * @return
	 */
	@RequestMapping("/showRegister")
	public String showRegister() {
		return "user/register";
	}
	
	@RequestMapping("/personal")
	public String personal() {
		return "user/personal";
	}


	@SuppressWarnings("finally")
	@RequestMapping("addInfo")
	public String add(User user, HttpServletRequest request) {
		try {
			// user.setId(UUID.randomUUID().toString());
			System.out.println(user.getId() + ":::::" + user.getUsername() + ":::::" + user.getPassword());
			String str = userService.addInfo(user);
			System.out.println(str);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "添加信息失败！具体异常信息：" + e.getMessage());
		} finally {

			return "result";
		}
	}

	@RequestMapping("getAll")
	public String getAddInfoAll(HttpServletRequest request) {
		try {
			List<User> list = userService.getAll();
			System.out.println("------User_list-----" + list.size());
			request.setAttribute("addLists", list);
			return "listAll";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping("del")
	public String del(int id, HttpServletRequest request) {
		try {
			String str = userService.delete(id);
			request.setAttribute("InfoMessage", str);
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "删除信息失败！具体异常信息：" + e.getMessage());
		} finally {
			return "result";
		}
	}

	@RequestMapping("modify")
	public String modify(int id, HttpServletRequest request) {
		try {
			User user = userService.findById(id);
			request.setAttribute("add", user);
			return "modify";
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("InfoMessage", "信息载入失败！具体异常信息：" + e.getMessage());
			return "result";
		}
	}

	@RequestMapping("/update")
	public void update(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String username = request.getParameter("username").trim();
		String tel = request.getParameter("tel").trim();
		String gender = request.getParameter("gender").trim();
		String birthday = request.getParameter("birthday").trim();
		String email = request.getParameter("email").trim();
		String address = request.getParameter("address").trim();
		String job = request.getParameter("job").trim();
		String school = request.getParameter("school").trim();
		String qq = request.getParameter("qq").trim();
		String company = request.getParameter("company").trim();
		String country = request.getParameter("country").trim();
		String info = request.getParameter("info").trim();

		User userinfo = userService.findById(this.getId(session));
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Date birthday1 = sdf.parse(birthday);
			userinfo.setBirthday(birthday1);
		} catch (ParseException e1) {
			e1.printStackTrace();
			result.put("status", "error");
			result.put("info", e1.getCause());
		}
		userinfo.setUsername(username);
		userinfo.setGender(Integer.valueOf(gender));
		userinfo.setTel(tel);
		userinfo.setEmail(email);
		userinfo.setAddress(address);
		userinfo.setJob(job);
		userinfo.setLastUpdateTime(new Date());
		userinfo.setSchool(school);
		userinfo.setQq(qq);
		userinfo.setCompany(company);
		userinfo.setCountry(country);
		userinfo.setInfo(info);

		try {
			userService.updateById(userinfo);
			result.put("status", "ok");
			result.put("info", "修改成功");
		} catch (Exception e1) {
			e1.printStackTrace();
			result.put("status", "error");
			result.put("info", e1.getCause());
		}
		session.setAttribute("user", userinfo);
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/updateTempPhoto")
	public void updateTempPhoto(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String photoURL = request.getParameter("photoURL").trim();
		System.out.println(photoURL+"——————————————————————————————");
		session.setAttribute("photoURL", photoURL);
	}

	@RequestMapping("/updatePhoto")
	public void updatePhoto(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String photoURL = request.getParameter("photoURL").trim();
		User userinfo = userService.findById(this.getId(session));
		// Map<String, Object> result = new HashMap<String, Object>();
		userinfo.setPhotoURL(photoURL);
		userService.updateById(userinfo);
		// 更新session
		session.setAttribute("user", userinfo);
		// result.put("status", "ok");
		// result.put("info", "修改成功");
		// ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/updatePwd")
	public void updatePwd(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String password = request.getParameter("password").trim();
		String newPassword = request.getParameter("newPassword").trim();
		User userinfo = userService.findById(this.getId(session));
		Map<String, Object> result = new HashMap<String, Object>();
		if (password.equals(Base64Util.getFromBase64(userinfo.getPassword()))) {
			userinfo.setPassword(Base64Util.getBase64(newPassword));
			userinfo.setLastUpdateTime(new Date());
			userService.updateById(userinfo);
			// session.setAttribute("user", userinfo);
			result.put("status", "ok");
		} else {
			result.put("status", "error");
		}
		// 返回结果
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/login")
	public void login(User user, HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verifyCode = request.getParameter("verifyCode");
		String verifyCodeValue = (String) session.getAttribute("verifyCodeValue");
		user.setUsername(username);
		user.setPassword(Base64Util.getBase64(password));
		Map<String, Object> result = new HashMap<String, Object>();
		User userinfo = userService.login(user);
		if (userService.findByUsername(username) == null) {
			result.put("success", "error");
			result.put("message", "用户不存在，请重新输入！");
		} else if (userinfo == null) {
			result.put("success", "error2");
			result.put("message", "密码错误，请重新输入！");
		} else if (!verifyCodeValue.equals(verifyCode.toUpperCase())) {
			result.put("success", "error3");
			result.put("message", "验证码错误，请重新输入！");
		} else {
			userinfo.setLastLoginTime(new Date());
			// 设置登录时间
			userService.updateById(userinfo);
			// 登录成功后，user对象存到session中
			session.setAttribute("user", userinfo);
			result.put("success", "ok");
			result.put("message", "登录成功！");
		}
		// 返回结果
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}

	@RequestMapping("/register")
	public void register(User user, HttpServletRequest request, HttpServletResponse response) {
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String tel = request.getParameter("tel").trim();
		String gender = request.getParameter("gender");
		user.setUsername(username);
		user.setPassword(Base64Util.getBase64(password));
		user.setGender(Integer.valueOf(gender));
		user.setTel(tel);
		Map<String, Object> result = new HashMap<String, Object>();
		if (userService.findByUsername(username) != null) {
			result.put("status", "error");
			result.put("info", "用户已存在，请重新输入！");
		} else {
			try {
				userService.addInfo(user);
				result.put("status", "ok");
				result.put("info", "注册成功！");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("status", "error2");
				result.put("info", "添加信息失败！具体异常信息：" + e.getCause());
			}

		}
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}


	/**
	 * 退出
	 * 
	 * @param session
	 * @return
	 */
	@RequestMapping("/exit")
	public String exit(HttpSession session) {
		// session无条件失效
		session.removeAttribute("user");
//		session.invalidate();
		return "redirect:../";
	}

	@RequestMapping("/createTable")
	public void createTable(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userService.createTable();
			result.put("status", "ok");
			result.put("info", "创建成功");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", "error");
			result.put("info", "创建失败！具体异常信息：" + e.getCause());
		}
		ResponseUtils.renderJson(response, JSONUtil.object2String(result));
	}
}
