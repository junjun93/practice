<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>设置中心</title>
</head>
<script type="text/javascript">
	$(function() {
		var font = "";
		var fontCn = "";
		$('#showFonts div').click(function() {
			font = $(this).css('font-family');
			fontCn = $(this).html();
			$(document.body).css('font-family', font);
		});

		$('#resetBtn').click(function() {
			$.messager.confirm({
			    width: 480,
			    height: 200, 
			    title: '操作确认',
			    msg: '您确认重置字体为默认样式吗？',
			    fn:  function(r) {
					if (r) {
						$.post("${ctx}/setting/setting", {
							"font" : "Microsoft YaHei,serif"
						});
						window.location.reload();
					}
			    }
				});
		});

		$('#divBtn').click(function() {
			$.messager.confirm({
			    width: 480,
			    height: 200, 
			    title: '操作确认',
			    msg: '您确认修改主字体为<strong>' + fontCn+ '</strong>吗？',
			    fn:  function(r) {
					if (r) {
						$.post("${ctx}/setting/setting", {
							"font" : font
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
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

#settingNav {
	padding: 20px;
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

#FontsIndex {
text-align: center;
    padding: 20px;
    position: absolute;
    left: 22%;
    top: 10%;
    width: 70%;
	background-color: rgba(100, 100, 100, 0.7);
	/* 	margin-left: -250px; */
	/* 	border-radius: 33px; */
}

.divBtn {
	cursor: pointer;
	font-size: 30px;
	text-align: center;
	padding: 20px;
	margin: 15px;
	    width: 25%;
	/* 	position: absolute; */
	/* 	left: 25%; */
	/* 	top: 60%; */
	/* 	width: 280px; */
	/* 	padding: 20px; */
	/* 	margin-left: -250px; */
	border-radius: 33px;
}

#selectiveFont {
	text-align: center;
	padding: 20px;
	color: white;
	display: none;
	background-color: rgba(100, 100, 100, 0.7);
}

#showFonts {
	padding: 20px;
}

#showFonts div {
	background: white;
	margin: 15px 20px;
	padding: 5px;
	text-align: left;
	font-size: 30px;
	display: inline-block;
	width: 155px;
	border-radius: 5px;
}

#showFonts div:hover {
	text-align: center;
	padding: 10px;
	border: 4px solid red;
	font-size: 40px;
}
</style>

<body>
	<div id="settingNav">
		<div id="personalInfo" onclick="window.location.href='${ctx}/setting/settingIndex'">字体设置</div>
		<div id="editInfo" onclick="window.location.href='${ctx}/setting/settingTheme'">主题设置</div>
	</div>

	<%@ include file="../include/header.jsp"%>
	<div id="FontsIndex">
	<h2>点击相应字体可预览效果</h2>
		<div id="showFonts">
			<div style="font-family: Microsoft YaHei, serif">微软雅黑</div>
			<div style="font-family: Microsoft JhengHei, serif;">微软正黑</div>
			<div style="font-family: SimHei, serif;">黑体</div>
			<div style="font-family: SimSun, serif;">宋体</div>
			<div style="font-family: NSimSun, serif;">新宋体</div>
			<div style="font-family: FangSong, serif;">仿宋</div>
			<div style="font-family: KaiTi, serif;">楷体</div>
			<div style="font-family: PMingLiU, serif;">新细明体</div>
			<div style="font-family: MingLiU, serif;">细明体</div>
			<div style="font-family: DFKai-SB, serif;">标楷体</div>
		</div>
		<div id="divBtn" class="divBtn">保存修改</div>
		<div id="resetBtn" class="divBtn">恢复默认</div>
	</div>
</body>

</html>