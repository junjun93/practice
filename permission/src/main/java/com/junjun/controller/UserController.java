package com.junjun.controller;

import com.junjun.model.SysUser;
import com.junjun.service.SysUserService;
import com.junjun.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author junjun
 * @date 2018/6/20 21:30:44
 **/
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private SysUserService sysUserService;

    @RequestMapping
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        String path = "signin.jsp";
        response.sendRedirect(path);
    }

    @RequestMapping("/login.page")
    public void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        //bug
        SysUser sysUser = sysUserService.findByKeyword(username);
        String errMsg = "";
        String ret = request.getParameter("ret");

        if(StringUtils.isBlank(username)){
            errMsg = "用户名不能为空";
        } else if(StringUtils.isBlank(password)){
            errMsg = "密码不能为空";
        } else if(sysUser == null){
            errMsg = "查询不到指定的用户";
        } else if(!sysUser.getPassword().equals(Md5Util.encrypt(password))){
            errMsg = "用户名或密码错误";
        } else if(sysUser.getStatus() != 1){
            errMsg = "用户已被冻结，请联系管理员";
            //回看源码
        } else {
            request.getSession().setAttribute("user", sysUser);
            if(StringUtils.isNotBlank(ret)){
                response.sendRedirect(ret);
            } else {
                response.sendRedirect("/admin/index.page");
            }
        }

        request.setAttribute("error", errMsg);
        request.setAttribute("username", username);
        if(StringUtils.isNotBlank(ret)){
            request.setAttribute("ret", ret);
        }
        String path = "signin.jsp";
        request.getRequestDispatcher(path).forward(request, response);
    }

}
