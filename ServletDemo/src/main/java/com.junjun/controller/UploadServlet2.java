package com.junjun.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

/**
 * @author junjun
 * @date 2018/9/18 17:40:43
 **/
@MultipartConfig
@WebServlet("/upload2.do")
public class UploadServlet2 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Part part = request.getPart("photo");
        String filename = getFilename(part);
        writeTo(filename, part);
    }

    private String getFilename(Part part){

        String header = part.getHeader("Content-Disposition");
        String filename = header.substring(header.indexOf("filename=\"") + 10, header.lastIndexOf("\""));
        return filename;
    }

    private void writeTo(String filename, Part part) throws IOException {

        InputStream in = part.getInputStream();
        OutputStream out = new FileOutputStream("/Users/junjun/Downloads/" + filename);
        byte[] buffer = new byte[1024];
        int length = -1;
        while((length = in.read(buffer)) != -1){
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
    }
}
