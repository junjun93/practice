<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
pageContext.setAttribute("path",path);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Examples</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link href="" rel="stylesheet">
		<style type="text/css" media="screen">
			
		</style>
	</head>
	<body>
	    
		<h1> com.junjun.demo.a.jsp页面 </h1>
		
		${param.userName }
	    
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js "></script>
	   	<script type="text/javascript">
	   		
	   	</script>
	</body>
</html>