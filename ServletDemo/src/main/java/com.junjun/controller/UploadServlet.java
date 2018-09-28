package com.junjun.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * @author junjun
 * @date 2018/9/18 10:42:27
 **/
@WebServlet("/upload.do")
public class UploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // 读取请求body
        byte[] body = readBody(request);
        // 取得所有body内容的字符串表示
        String textBody = new String(body, "ISO-8859-1");
        // 取得上传的文件名称
        String fileName = getFileName(textBody);
        // 取得文件开始与结束位置
        Position p = getFilePosition(request, textBody);
        // 输出至文件
        writeTo(fileName, body, p);
    }

    class Position{
        int begin;
        int end;
        Position(int begin, int end){
            this.begin = begin;
            this.end = end;
        }
    }

    private byte[] readBody(HttpServletRequest request) throws IOException {

        int formDataLength = request.getContentLength();
        DataInputStream dataStream = new DataInputStream(request.getInputStream());
        byte[] body = new byte[formDataLength];

        // 改写成for循环
        int totalBytes = 0;
        while(totalBytes < formDataLength){
            int bytes = dataStream.read(body, totalBytes, formDataLength);
            totalBytes += bytes;
        }
        return body;
    }

    private String getFileName(String reqBody){

        String filename = reqBody.substring(reqBody.indexOf("filename=\"") + 10);
        filename = filename.substring(0, filename.indexOf("\n"));
        filename = filename.substring(filename.lastIndexOf("\\") + 1, filename.indexOf("\""));
        return filename;
    }

    private Position getFilePosition(HttpServletRequest request, String textBody) throws IOException {

        // 取得文件区段的边界信息
        String contentType = request.getContentType();
        String boundaryText = contentType.substring(contentType.lastIndexOf("=") + 1, contentType.length());
        // 取得实际上传文件的起始与结束位置
        int pos = textBody.indexOf("filename=\"");
        pos = textBody.indexOf("\n", pos) + 1;
        pos = textBody.indexOf("\n", pos) + 1;
        pos = textBody.indexOf("\n", pos) + 1;

        int boundaryLoc = textBody.indexOf(boundaryText, pos) - 4;
        int begin = ((textBody.substring(0, pos)).getBytes("ISO-8859-1")).length;
        int end = ((textBody.substring(0, boundaryLoc)).getBytes("ISO-8859-1")).length;
        return new Position(begin, end);
    }

    private void writeTo(String filename, byte[] body, Position p) throws IOException {

        FileOutputStream fileOutputStream = new FileOutputStream("/Users/junjun/Downloads/" + filename);
        fileOutputStream.write(body, p.begin, (p.end-p.begin));
        fileOutputStream.flush();
        fileOutputStream.close();
    }
}
