<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/web/include/public.jsp"%>
<%@ include file="/web/include/header.jsp"%>
<title>首页</title>
<script type="text/javascript">
	// 元素跟随鼠标移动
	// document.onmousemove=function(e){
	//     var div=document.getElementById("Bn");
	//     div.style.left=(e.clientX+20)+"px";
	//     div.style.top=(e.clientY+20)+"px";
	// }
	function f1() {
		$.messager.alert('right', "you are right！");
	}
	function f() {
		document.onmousemove = function(e) {
			$('#Bn').css('left', (e.clientY + 30) + "px");
			$('#Bn').css('top', (e.clientX - 30) + "px");
		}
	}

	function f2() {
		$.messager.alert('right', '你竟然点到了，厉害');
	}

	$(function() {

		//监控enter键查询
		document.onkeydown = function(event) {
			var e = event || window.event
					|| arguments.callee.caller.arguments[0];
			if (e && e.keyCode == 13) { // enter 键
				$("#searchBtn").click();
			}
		}
		//	 进入后将焦点放入用户输入框
		$("#username").focus();

		$("#upload_form").submit(function() {

		});
	});
	function search() {
		var val = $("#searchText").val();
		if (val == null) {
			val = "";
		}
		window.open("https://www.baidu.com/s?wd=" + val + "&ie=UTF-8",
						"_blank");
	}
</script>
<style>
#Index { /**样式的名字 对应class=xxx**/
	color: white;
	font-family: '微软雅黑';
	padding: 100px;
	background-size: 100%, 100%;
	background-repeat: round;
	position: absolute; /**绝对定位**/
	left: 50%; /**左边50%**/
	top: 50%; /**顶部50%**/
	margin-top: -300px;
	margin-left: -450px;
	border-radius: 33px;
}

#searchText {
width: 500px; 
height: 49px;
border-radius: 5px;
}
#searchBtn {
	left: -10px;
	width: 120px;
	height: 49px;
	text-align: center;
	display: inline-block;
	border-left: 0;
	padding: 0;
	line-height: 45px;
	font-family: Arial;
	letter-spacing: 1px;
	background: #38f;
	color: #fff;
	border: 0;
	box-sizing: border-box;
	border-bottom: 1px solid #2d78f4;
	cursor: pointer;
}

html {
	margin: 0;
	padding: 0;
	height: 100%;
}

body {
	margin: 0;
	padding: 100px 0px 0px 0px;
	height: 100%;
	background-color: #fff;
	box-shadow: 0px 0px 80px #000 inset;
}

#pbtn {
	width: 400px;
	height: 200px;
	background-color: #ccf;
	margin: 0px auto 0px auto;
	text-align: center;
	border-radius: 200px/100px;
	box-shadow: 0px -15px 15px #88f inset, 10px -15px 15px #44f inset, -10px
		-15px 15px #fff inset, -0px 15px #88f, -35px 40px 5px
		rgba(0, 0, 0, 0.5);
	transition: box-shadow .25s linear, margin-top .25s linear;
	color: #88f;
	font-size: 100px;
	position: absolute;
    bottom: 35%;
    left: 35%;
}

#pbtn:hover {
	box-shadow: 0px -15px 15px #88f inset, 10px -15px 15px #44f inset, -10px
		-15px 15px #fff inset, -0px 2px #88f, -7px 12px 5px rgba(0, 0, 0, 0.5);
	margin-top: 15px;
}
#pbtn:active {
	box-shadow: 0px -15px 15px #88f inset, 10px -15px 15px #44f inset, -10px
		-15px 15px #fff inset, -0px 2px #88f, -7px 12px 5px rgba(0, 0, 0, 0.5);
	margin-top: 15px;
}

#btnlabel {
	padding-top: 0px;
	line-height: 100px;
	text-shadow: 3px -3px 1px #44f, -3px 3px 1px #fff;
	transform: scale(1, 0.5);
}
</style>
<body>
	
	
<div style="text-align:center;clear:both;">
</div>


	<div id="pbtn">
		<div id="btnlabel" onclick="search()" style="font-size: 80px;">
			百度一下<br />&hearts;
		</div>
	</div>

	<div style="text-align: center; clear: both; margin-top: 70px">
	</div>


	<div id="Index">
	<div>
			<div id="By">Welcome to My Project！Do you love me?</div>
			<div id="By" class="divBtn" onclick="f1()">Yes</div>
			<div id="Bn" class="divBtn" onMouseOver="f()" onclick="f2()" style="position: fixed;">No</div>
		</div>
		<input id="searchText" type="text" autofocus="autofocus" placeholder="请输入搜索内容"">
<!-- 		<div id="searchBtn" onclick="search()">百度一下</div> -->
		
	</div>
</body>
