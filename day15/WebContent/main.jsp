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
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>Examples</title>
		<meta name="description" content="">
		<meta name="keywords" content="">
		<link href="" rel="stylesheet">
		<style type="text/css" media="screen">
			table{
				border-collapse: collapse; text-align: center;
			}
			tr,td{
				border: 1px solid black;
			}
		</style>
	</head>
	<body>
		
		<table>
			<tr>
				<td>#编号</td>
				<td>邮箱</td>
				<td>密码</td>
			</tr>
			<c:forEach items="${sessionScope.userList }" var="user">
				<tr>
					<td>${user.id }</td>
					<td>${user.email }</td>
					<td>${user.password }</td>
				</tr>
			</c:forEach>
		</table>
		
	    
	    <script src="https://code.jquery.com/jquery-3.2.1.min.js "></script>
	   	<script type="text/javascript">
	   		
	   	</script>
	</body>
</html>