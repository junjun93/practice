package com.junjun.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;

/**
 * @author junjun
 * @date 2018/9/18 17:36:20
 **/
@MultipartConfig(location = "/Users/junjun/Downloads/")
@WebServlet("/upload3.do")
public class UploadServlet3 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        for(Part part : request.getParts()){

            // 只处理上传文件区域
            if(part.getName().startsWith("file")){
                String filename = getFileName(part);
                part.write(filename);
            }
        }
    }

    private String getFileName(Part part){

        String header = part.getHeader("Content-Disposition");
        String filename = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        return filename;
    }
}
