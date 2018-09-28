package com.junjun.controller;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;

/**
 * @author junjun
 * @date 2018/9/20 15:41:03
 **/
@WebServlet(
    urlPatterns = {"/mail.do"},
    initParams={
        @WebInitParam(name = "mailHost", value = "smtp.gmail.com"),
        @WebInitParam(name = "mailPort", value = "465"),
        @WebInitParam(name = "username", value = "xidada2.0@gmail.com"),
        @WebInitParam(name = "password", value = "1m35e92i51y52o1u")
    }
)
public class MailServlet extends HttpServlet {

    private String mailHost;
    private String mailPort;
    private String username;
    private String password;
    private Properties props;

    @Override
    public void init(){

        mailHost = getServletConfig().getInitParameter("mailHost");
        mailPort = getServletConfig().getInitParameter("mailPort");
        username = getServletConfig().getInitParameter("username");
        password = getServletConfig().getInitParameter("password");

        props = new Properties();
        props.put("mail.smtp.host", mailHost);
        props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", mailPort);
        props.setProperty("mail.smtp.socketFactory.port", mailPort);
        props.setProperty("mail.smtp.auth", "true");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response .setContentType("text/html;charset=UTF-8");

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String text = request.getParameter("text");
        try {
            Message message = getMessage(from, to, subject, text);
            Transport.send(message);
            response.getWriter().println("邮件发送成功");
        } catch (MessagingException e) {
            throw new ServletException(e);
        }
    }

    private Message getMessage(String from, String to, String subject, String text) throws MessagingException {

        Session session = Session.getDefaultInstance(props,
                new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setSentDate(new Date());
        message.setText(text);
        return message;
    }
}
