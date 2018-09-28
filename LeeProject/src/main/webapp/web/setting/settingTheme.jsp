<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>主题设置</title>
</head>
<script type="text/javascript">
	$(function() {
		var s = "squareFlash-闪耀的方格\r\n" + "vortex-漩涡\r\n"
				+ "bouncingBalls-弹力球\r\n" + "shootingLines-射击的光线\r\n"
				+ "simpleGradient-简单的梯度\r\n" + "starfield-飞舞的星星\r\n"
				+ "layeredTriangles-分层的三角形\r\n" + "cornerSpikes-角尖刺\r\n"
				+ "floatingBoxes-漂浮的箱子\r\n" + "defaultTheme-默认主题";
		var ss = s.split("\r\n");
		// //		String [] ss2 =s2.split("\r\n");

		for (var i = 0; i < ss.length; i++) {
			var sss = ss[i].split("-");
			$('#showThemes').append(
					"<div id = \""+sss[0]+"\">" + sss[0] + "<br/>" + sss[1]
							+ "</div>");
		}
		var theme = "";
		var themeName = "";
		$('#showThemes div').click(function() {
			theme = $(this).attr('id');
			themeName = $(this).html();
			console.log(theme);
			settingTheme(theme);
			// 			$(document).quietflow({
			// 	            theme: theme
			// 	        })
		})

		$('#resetBtn').click(function() {
			$.messager.confirm({
				width : 480,
				height : 200,
				title : '操作确认',
				msg : '您确认将主题设置为随机样式吗？',
				fn : function(r) {
					if (r) {
						$.post("${ctx}/setting/setting", {
							"theme" : "random"
						});
						window.location.reload();
					}
				}
			});
		});

		$('#divBtn').click(
				function() {
					$.messager.confirm({
						width : 480,
						height : 200,
						title : '操作确认',
						msg : '您确认修改主题为<strong>'
								+ themeName.replace("<br>", "-")
								+ '</strong>吗？',
						fn : function(r) {
							if (r) {
								$.post("${ctx}/setting/setting", {
									"theme" : theme
								});
								window.location.reload();
							}
						}
					});
				});

	});
</script>
<style>
#settingNav div:hover {
	background: #00FF00;
	font-size: larger;
	color: #333333;
	text-shadow: white 0.1em 0.1em 0.2em;
}

#settingNav div {
	cursor: pointer;
	text-align: center;
	font-size: 20px;
	padding: 20px;
	border: 1px solid #96c2f1;
	background: #eff7ff;
	font-family: verdana, arial, sans-serif;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

#settingNav {
	padding: 20px;
	/*     background: gray; */
	position: absolute;
	left: 25%;
	top: 50%;
	width: 280px;
	margin-top: -300px;
	margin-left: -450px;
	border-radius: 33px;
	margin-left: -450px;
	left: 30%;
	top: 50%;
}

#ThemeIndex {
	text-align: center;
	padding: 20px;
	position: absolute;
	left: 22%;
	top: 10%;
	background-color: rgba(100, 100, 100, 0.7);
	width: 70%;
}

.divBtn {
	cursor: pointer;
	font-size: 30px;
	text-align: center;
	padding: 20px;
	margin: 15px;
	width: 25%;
	border-radius: 33px;
}

#selectiveTheme {
	/* 	text-align: center; */
	padding: 20px;
	color: white;
	display: none;
	background-color: rgba(100, 100, 100, 0.7);
}

#showThemes div {
	background: white;
	margin: 15px 30px;
	padding: 15px;
	font-size: 20px;
	display: inline-block;
	width: 155px;
	border-radius: 5px;
}

#showThemes div:hover {
	border: 4px solid red;
}
</style>

<body>
	<div id="settingNav">
		<div id="personalInfo" onclick="window.location.href='${ctx}/setting/settingIndex'">字体设置</div>
		<div id="editInfo" onclick="window.location.href='${ctx}/setting/settingTheme'">主题设置</div>
	</div>

	<%@ include file="../include/header.jsp"%>
	<div id="ThemeIndex">
		<h2>点击相应主题可预览效果</h2>
		<div id="showThemes"></div>
		<!-- 		<div id="selectiveTheme"></div> -->
		<div id="divBtn" class="divBtn">保存修改</div>
		<div id="resetBtn" class="divBtn">随机主题</div>
	</div>
</body>

</html>