<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
	Properties props = System.getProperties();
	Map<String, String> map = System.getenv();
	String computerName = map.get("COMPUTERNAME");// 获取计算机名 
	String userDomain = map.get("USERDOMAIN");// 获取计算机域名 
	String osName = props.getProperty("os.name");
	String osArch = props.getProperty("os.arch");
	String osVersion = props.getProperty("os.version");
	String userName = props.getProperty("user.name");
	String javaVersion = props.getProperty("java.version");
	Date d = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy年MM月dd日");
	String now = df.format(d);
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />
<!DOCTYPE html>
<script type="text/javascript">
	$(function() {
		var checked = $.session.get('dayAndNight');
		var check = null;
		console.log(checked);
		if ('night' == checked) {
			$('#header,#header a,#footer').css('color', 'black');
			$('#header,#footer').css('background', '#fff');
			check = false;
		} else {
			$('#header,#header a,#footer').css('color', 'white');
			$('#header,#footer').css('background', '#2F2F2F');
			check = true;
		}
		$('#dayAndNight').switchbutton({
			checked : check,
			width : 130,
			onText : '夜间模式',
			offText : '默认模式',
			onChange : function(checked) {
				if (checked == true) {
					$('#header,#header a,#footer').css('color', 'white');
					$('#header,#footer').css('background', '#2F2F2F');
					$.session.set('dayAndNight', 'day')
					console.log(checked);
					return;
				}
				if (checked == false) {
					$('#header,#header a,#footer').css('color', 'black');
					$('#header,#footer').css('background', '#fff');
					$.session.set('dayAndNight', 'night')
					console.log(checked);
					return;
				}
			}
		})

		console.log("俊仔等候您多时了，欢迎来到俊仔的项目！！！");
		var title = $(document).attr("title");
		$('#location strong').html(title);

		$.get("${ctx}/main/getPhotos");

		$("#headerLeft strong,#headerLeft img").hover(function() {
			$("#navList").slideDown(200);
		});
		$("#navList").mouseleave(function() {
			$("#navList").slideUp(200);
		});
		$("#passenger").hover(function() {
			$("#personNav").slideDown(200);
		});
		$("#passenger").mouseleave(function() {
			$("#personNav").slideUp(200);
		});
		$("#personal").hover(
				function() {
					$("#personNav").slideDown(200);
					$("#personNav img").attr('alt', '${user.photoURL}');
					$("#personNav img").attr('src',
							'${ctxStatic}/img/photos/${user.photoURL}');
					$("#personNav p").html('${user.username}');
					$("#personNav").slideDown(200);
				});
		$("#personal").mouseleave(function() {
			$("#personNav").slideUp(200);
		});

		$("#WeChat").hover(function() {
			$("#myWeChat").fadeIn(2000);
			$('#myWeChat').window({
				width : 560,
				height : 560,
				collapsible : false,
				minimizable : false,
				maximizable : false,
				closable : false,
				title : 'MyWeChat-快打开微信扫一扫吧！',
			});
		});

		$("#WeChat").mouseleave(function() {
			$('#myWeChat').window('minimize');
		});
		$("#QQ").hover(function() {
			$("#myQQ").fadeIn(2000);
			$('#myQQ').window({
				width : 560,
				height : 560,
				collapsible : false,
				minimizable : false,
				maximizable : false,
				closable : false,
				title : 'MyQQ-快打开QQ扫一扫吧！',
			});
		});
		$("#QQ").mouseleave(function() {
			$('#myQQ').window('minimize');
		});

		$("#weibo").hover(function() {
			$("#myWeibo").fadeIn(2000);
			$('#myWeibo').window({
				width : 560,
				height : 560,
				collapsible : false,
				minimizable : false,
				maximizable : false,
				closable : false,
				title : 'MyWeibo-快打开微博扫一扫吧！',
			});
		});
		$("#weibo").mouseleave(function() {
			$('#myWeibo').window('minimize');
		});
		$("#weibo")
				.click(
						function() {
							window
									.open(
											"https://weibo.com/p/1005053055153171/home?from=page_100505&mod=TAB&is_all=1#place",
											"_blank");
						});

		$("#createTable").click(function() {
			$.messager.confirm('确认', '是否创建一个用户表便于项目测试？', function(r) {
				if (r) {
					$.get("${ctx}/user/createTable", function(dataobj) {
						if (dataobj.status == "error") {
							$.messager.alert({
								width : 700,
								height : 300,
								title : '提示',
								msg : dataobj.info,
								style : {
									right : '',
								}

							});
							return;
						} else if (dataobj.status == "ok") {
							$.messager.alert('提示', dataobj.info, 'info');
						} else {
							$.messager.alert('提示', '系统繁忙！', 'info');
							return;
						}
					}, 'json');
				}
			});
		});
	});

	function startQQ() {
		$.get("${ctx}/main/startQQ", function(dataobj) {
			if (dataobj.status == "error") {
				$.messager.alert('提示', dataobj.info, 'info');
				return;
			}
		}, 'json');
	}

	//	修改头像
	function editTempPhoto() {
		$('#win2').window({
			title : '修改头像',
			width : 1300,
			height :600,
			openAnimation : 'show',
			zIndex : 99
		});
		var photoURL = "";
		$('#win2 img').click(function() {
			var checkedAlt = $(this).attr('alt');
			var checkedSrc = $(this).attr('src');
			$('#myPhoto').attr('src', checkedSrc);
			$('#myPhoto').attr('alt', checkedAlt);
			photoURL = $(this).attr('alt');
		});
		$("#savePhoto").click(function() {
			$.messager.alert('提示', "请登录！", 'info');
		});
	}

	function about() {
		$('#aboutMine').fadeIn();
		$('#aboutMine').window({
			width : 560,
			height : 560,
			collapsible : false,
			minimizable : false,
			maximizable : false,
			title : '关于！'
		});
	}
</script>
<style>
#aboutMine div {
	margin: 5%;
}

#header {
	width: 100%;
	position: absolute;
	top: 0;
	left: 0;
	height: 30px;
	z-index: 9999;
	box-shadow: 0 0 5px #888;
	background: #fff;
	border-bottom: 1px solid black;
}

#footer {
	width: 100%;
	position: fixed;
	bottom: 0;
	left: 0;
	height: 30px;
	z-index: 9999;
	padding-top: 10px;
	box-shadow: 0 0 5px #888;
	background: #fff;
	border-bottom: 1px solid black;
}

#header img {
	width: 30px;
	height: 30px;
}

#headerLeft img {
    position: absolute;
    left: -60px;
}
#header div {
	display: inline-block;
}

#headerLeft {
	position: absolute;
	left: 60px;
}

.headerRight {
	float: right;
}

#headerLeft>strong {
	font-size: 20px;
}

#footer img {
	width: 20px;
	height: 20px;
}

#personNav {
	position: absolute;
	right: 0;
	top: 30px;
	display: none;
	background-color: rgba(240, 255, 255, 0.8);
	border-radius: 10px;
}

#navList {
	position: absolute;
	width: 20%;
	top: 30px;
	left: 0;
	display: none;
	z-index: 9999;
	background-color: rgba(240, 255, 255, 0.8);
	border-radius: 10px;
}

#navList div {
	height: 66px;
	cursor: pointer;
}

#navList div:hover {
	text-align: center;
	background: #00FF00;
	font-size: larger;
	color: #333333;
	text-shadow: white 0.1em 0.1em 0.2em;
}

#navList img {
	width: 65px;
}

#navList span {
	font-size: 40px;
	color: black;
	position: relative;
	top: -20%;
}

.personName {
	font-size: 20px;
	position: absolute;
	right: 50px;
}

#photos img {
	width: 150px;
	height: 150px;
}

#footer div {
	cursor: pointer;
	display: inline;
	padding-left: 50px;
	padding-right: 50px;
}

#location {
	font-size: 20px;
	position: absolute;
	right: 200px;
}
</style>
</head>
<!-- 页面顶部-->
<div id="header">
	<div id="headerLeft">
		<img alt="俊仔" src="${ctxStatic}/img/author.jpg"> <strong>欢迎来到俊仔的项目</strong> <a href="${ctx}/">首页</a>
		<c:if test="${user==null}">
			<a href="${ctx}/user/showLogin">登录</a>
			<a href="${ctx}/user/showRegister">注册</a>
		</c:if>
		<a href="${ctx}/admin/">管理员</a>
		<a href="${ctx}/tool/DBTest">测试数据库</a> 
		<a href="${ctx}/tool/ExceltoSQL">SQL生成工具</a>
		<a href="${ctx}/tool/mybatisGenerator">Mybatis代码生成工具</a>
	</div>
	<div class="headerRight">
		<span id="location"> 您当前的位置-<strong>首页</strong>
		</span>
		<c:if test="${user==null}">
			<div id="passenger" onclick="editTempPhoto()">
				<img style="float: right; cursor: pointer;" alt="游客模式" src="${ctxStatic}/img/photos/default.jpg"> <strong class="personName">游客模式</strong>
			</div>
		</c:if>
		<c:if test="${user!=null}">
			<div id="personal" title="个人中心" onclick="window.location.href='${ctx}/user/personal'" class="easyui-tooltip">
				<img style="float: right; cursor: pointer;" alt="${user.username}" src="${ctxStatic}/img/photos/${user.photoURL}"> <strong class="personName">${user.username}</strong>
			</div>
		</c:if>
	</div>

</div>


<div id="footer" style="font-size: 15px;">
	<strong style="margin-left: 10px;">本项目仅供测试使用</strong>
	<div id="QQ" onclick="startQQ();">
		<img alt="QQ" src="${ctxStatic}/img/QQ.png"> <a>QQ联系</a>
	</div>
	<div id="WeChat">
		<img alt="WeChat" src="${ctxStatic}/img/WeChat.png"> <a>微信联系</a>
	</div>
	<div id="weibo">
		<img alt="weibo" src="${ctxStatic}/img/weibo.png"> <a>微博联系</a>
	</div>
	<div id="dayAndNight" style="position: absolute;top: 8px;">夜间模式</div>
	<div id="time" style="position: absolute; right: 0;">
		<a onClick="alert('珍爱时间!');"><%=now%></a>
	</div>
</div>

<div id="myWeChat" style="display: none;">
	<img alt="WeChat" src="${ctxStatic}/img/myWeChat.jpg">
</div>
<div id="myQQ" style="display: none;">
	<img alt="myQQ" src="${ctxStatic}/img/myQQ.jpg">
</div>
<div id="myWeibo" style="display: none;">
	<img alt="myWeibo" src="${ctxStatic}/img/myWeibo.jpg">
</div>

<div id="win2" style="display: none;">
	<div id="photos" class="easyui-layout" data-options="fit:true">
		<div data-options="region:'west',split:true" style="width: 200px; padding: 20px;">
			<p>我的头像</p>
			<c:if test="${user!=null}">
				<img id="myPhoto" alt="${user.photoURL}" src="${ctxStatic}/img/photos/${user.photoURL}">
			</c:if>
			<c:if test="${user==null}">
				<img id="myPhoto" alt="游客模式" src="${ctxStatic}/img/photos/default.jpg">
			</c:if>
			<p>
				<strong>用户名:</strong>${user.username}</p>
			<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" id="savePhoto">保存</a>
		</div>
		<div style="padding: 20px;" data-options="region:'center'">

			<c:forEach items="${list}" var="li">
				<img alt="${li}" src="${ctxStatic}/img/photos/${li}">
			</c:forEach>
		</div>
	</div>
	<div>
		<img alt="" src="">
	</div>
	<br> <br>
	<div style="text-align: center; color: red;"></div>
	<br> <br> <a id="save" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onClick="savePwd()">保存</a>
</div>

<div id="navList" style="padding: 10px;">
	<div id="home" onclick="window.location.href='${ctx}/'">
		<img alt="首页" src="${ctxStatic}/img/navListLogo/home.png"><span>首页</span>
	</div>
	<div id="games" onclick="window.location.href='${ctx}/movie/movieIndex'">
		<img alt="电影" src="${ctxStatic}/img/navListLogo/movie.png"><span>电影</span>
	</div>
	<div id="games" onclick="window.location.href='${ctx}/game/gameIndex'">
		<img alt="游戏" src="${ctxStatic}/img/navListLogo/game.png"><span>游戏</span>
	</div>
	<div id="tools" onclick="window.location.href='${ctx}/tool/toolIndex'">
		<img alt="工具" src="${ctxStatic}/img/navListLogo/tool.png"><span>工具</span>
	</div>
	<div id="databases" onclick="window.location.href='${ctx}/tool/DBTest'">
		<img alt="数据库调试" src="${ctxStatic}/img/navListLogo/database.png"><span>数据库调试</span>
	</div>
	<div id="settings" onclick="window.location.href='${ctx}/setting/settingIndex'">
		<img alt="设置" src="${ctxStatic}/img/navListLogo/setting.png"><span>设置</span>
	</div>
	<div id="about" onclick="about();">
		<img alt="关于" src="${ctxStatic}/img/navListLogo/about.png"><span>关于</span>
	</div>
</div>
<div id="aboutMine" style="display: none; padding: 20px;">
	<div>
		<strong>我的操作系统:</strong><%=osName%></div>
	<div>
		<strong>我的操作系统的构架:</strong><%=osName%></div>
	<div>
		<strong>我的操作系统的版本:</strong><%=osArch%></div>
	<div>
		<strong>我的大名:</strong><%=userName%></div>
	<div>
		<strong>我的计算机名:</strong><%=computerName%></div>
	<div>
		<strong>我的Java版本:</strong><%=javaVersion%></div>
	<div>
		<strong>我的服务器信息:</strong>${pageContext.servletContext.serverInfo}</div>
</div>
<div id="personNav" style="padding: 10px;">
	<img alt="游客模式" src="${ctxStatic}/img/photos/default.jpg">
	<p style="text-align: center;">游客模式</p>
	<c:if test="${ps.font!=null}">
		<p style="text-align: center;">您当前的字体:<strong>${ps.font}</strong></p>
	</c:if>
	<c:if test="${ps.theme!=null}">
		<p style="text-align: center;">您当前的主题:<strong>${ps.theme}</strong></p>
	</c:if>
</div>
