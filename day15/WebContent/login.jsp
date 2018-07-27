<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("path",path);
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="zh-CN"><head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>login...</title>
    <link href="${path }/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        
        body {
            padding-top: 120px;
            padding-bottom: 40px;
            background-color: #eee;
        }
        .form-signin {
            max-width: 330px;
            padding: 15px;
            margin: 0 auto;
        }
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            height: auto;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
            padding: 10px;
            font-size: 16px;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }
    </style>
    
  </head>
	
  <body>
	
    <div class="container">
        <form class="form-signin" action="${path }/userServlet" method="Post">
            <label for="inputEmail" class="sr-only">用户名</label>
            <input type="email" id="inputEmail" class="form-control" placeholder="请输入电子邮箱" name="email">
            <label for="inputPassword" class="sr-only">密码</label>
            <input type="password" id="inputPassword" class="form-control" placeholder="请输入密码" name="password">
            <div class="checkbox">
                <label>
                    <input id="remember" type="checkbox" value="remember" name="remember"> 是否记住用户名
                </label>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        </form>
    </div>
	
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">
	
		$(function(){
			
			//获取浏览器中的Cookie
			var cookieString = document.cookie;
			
			var cookies = cookieString.split("; ");  //email="123@qq.com"  password=123
			
			for(var i = 0; i < cookies.length; i++){
				var arr = cookies[i].split("=");
				switch(arr[0]){
					case "email":
						$("#inputEmail").val(arr[1].replace(/"/g,""));
						break;
					case "password":
						$("#inputPassword").val(arr[1]);
						break;
					case "remember":
						$("#remember").attr("checked","checked")
				}
			}
			
			
			
			
		});
	
	</script>
	
	
	
	
	
	
</body>
</html>