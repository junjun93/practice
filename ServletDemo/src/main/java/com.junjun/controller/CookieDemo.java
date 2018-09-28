package com.junjun.controller;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author junjun
 * @date 2018/9/18 18:06:07
 **/
public class CookieDemo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Cookie[] cookies = request.getCookies();
        if(cookies != null){
            for(Cookie cookie : cookies){
                String name = cookie.getName();
                String value = cookie.getValue();
                if("user".equals(name) && "caterpillar".equals(value)){
                    request.setAttribute(name, value);
                    request.getRequestDispatcher("/user.view").forward(request, response);
                }
            }
        }
        response.sendRedirect("login.html");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}


