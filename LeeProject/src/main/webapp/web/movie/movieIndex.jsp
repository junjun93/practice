<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="utf-8">
<%@ include file="../include/public.jsp"%>
<title>电影中心</title>
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
	
	function showInfo(id) {
		$("#"+id).slideDown();
	}
	
	function hideInfo(id) {
		$("#"+id).slideUp();
	}
	
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
#movieIndex { /**样式的名字 对应class=xxx**/
	color: white;
	padding: 2%;
}

#movieIndex>div {
	display: inline-block;
	padding: 1%;
}

#movieIndex h1 {
	text-align: center;
}

#movieIndex img {
	width: 240px;
	height: 320px;
	cursor: pointer;
}

#movieIndex .info {
	width: 240px;
	color: black;
	padding: 20px;
	display: none;
	cursor: pointer; position : absolute;
	top: 0;
	left: 0;
	background-color: rgba(240, 255, 255, 0.82);
	position: absolute;
}

#movieIndex p {
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

	<div id="movieIndex">
		<c:forEach items="${movieList}" var="li">
			<div style="position: relative;" onmousemove="showInfo(${li.id});" onmouseleave="hideInfo(${li.id});">
				<img src="${ctxStatic}/img/movie/${li.moviePoster}" alt="${li.moviePoster}" onclick="window.location.href='${ctx}/movie/movieInfo?id=${li.id}'">
				<h3>${li.movieName}</h3>
				<div id="${li.id}" onclick="window.location.href='${ctx}/movie/movieInfo?id=${li.id}'" class="info">　　${li.movieInfo}</div>
			</div>
			<!-- <!-- 	<div id="mi" style="width: 240px;z-index: 999;"></div> -->
			<%-- <div style="background:url('${ctx}/img/movie/${li.moviePoster}') no-repeat; width:100px;height:50px">添加文字</div>  --%>
			<%-- 			<img onmouseenter="showInfo('${li.movieInfo}');" alt="${li.movieName}" onclick="window.location.href='${ctx}/movie/movieInfo?id=${li.id}'" src="${ctx}/img/movie/${li.moviePoster}"> --%>

		</c:forEach>
	</div>
	<%@ include file="../include/header.jsp"%>

</body>
</html>