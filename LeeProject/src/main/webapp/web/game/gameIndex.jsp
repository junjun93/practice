<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>游戏中心</title>
</head>
<script type="text/javascript">
	$(function() {
		$('#searchText').textbox({
			labelPosition : 'top',
			labelWidth : 145,
			labelAlign : 'left',
			required : true
		})

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
	});
	function search() {
		var val = $("#searchText").val();
		if (val == null) {
			val = "";
		}
		window
				.open("https://www.baidu.com/s?wd=" + val + "&ie=UTF-8",
						"_blank");
	}
</script>
<style>
#gameIndex { /**样式的名字 对应class=xxx**/
	text-shadow: black 0.1em 0.1em 0.2em;
	color: white;
	padding: 100px;
}

#gameIndex div {
	display: inline-block;
}

#gameIndex img {
	height: 200px;
	cursor: pointer;
}

#gameIndex img:hover {
	z-index: -1;
	height: 230px;
}

#gameIndex p {
	margin-left: -33px;
	font-weight: bold;
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
	letter-spacing: 1px;
	background: #38f;
	color: #fff;
	border: 0;
	box-sizing: border-box;
	border-bottom: 1px solid #2d78f4;
	cursor: pointer;
}
</style>
<body>
	<div id="gameIndex">
		<!-- 	<input><div>搜索游戏</div> -->
		<div id="sanker">
			<img alt="贪吃蛇" onclick="window.open('${ctx}/game/snake','_blank')" src="${ctxStatic}/img/game/snaker.png">
			<h1>贪吃蛇</h1>
		</div>
		<div id="g2048">
			<img alt="2048" onclick="window.open('${ctx}/game/g2048','_blank')" src="${ctxStatic}/img/game/2048.png">
			<h1>2048</h1>
		</div>
		<div id="shooter">
			<img alt="飞机大战" onclick="window.open('${ctx}/game/shooter','_blank')" src="${ctxStatic}/img/game/shooter.png">
			<h1>飞机大战</h1>
		</div>
		<div id="tetris">
			<img alt="俄罗斯方块" onclick="alert('待完成...');" src="${ctxStatic}/img/game/tetris.png">
			<h1>俄罗斯方块</h1>
		</div>
	</div>
	<%@ include file="../include/header.jsp"%>

</body>
</html>