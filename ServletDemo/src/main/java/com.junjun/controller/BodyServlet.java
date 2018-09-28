package com.junjun.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author junjun
 * @date 2018/9/18 10:40:11
 **/
@WebServlet("/body.view")
public class BodyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String body = readBody(request);
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet BodyView</title>");
        out.println("</head>");
        out.println("<body>");
        out.println(body);
        out.println("</body>");
        out.println("</html>");
    }

    private String readBody(HttpServletRequest request) throws IOException {

        // 取得BufferedReader对象
        BufferedReader reader = request.getReader();
        String input = null;
        String requestBody = "";
        while((input = reader.readLine()) != null){
            requestBody = requestBody + input + "<br>";
        }
        return requestBody;
    }
}
