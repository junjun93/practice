<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>电影详情</title>
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
#movieInfo { /**样式的名字 对应class=xxx**/
	padding: 3%;
}
#moviePoster{
      width: 36%;
    display: inline-block;
}
#movieDetails{
    display: inline-block;
    position: absolute;
    background-color: rgba(255, 255, 255, 0.8);
    width: 55%;
    border-radius: 20px;
     padding: 1% 3%;
}
#movieDetails strong{
font-size: 25px;
}

#movieInfo img {
	 width: 480px;
	cursor: pointer;
}

#movieInfo p {
	margin-left: -33px;
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
	<%@ include file="../include/header.jsp"%>
	<div id="movieInfo">
<div id="moviePoster"><img style="" alt="" src="${ctxStatic}/img/movie/${movie.moviePoster}" /></div>
<div id="movieDetails">
<div style="font-weight: normal;">
<strong>电影名　:</strong>${movie.movieName}<br/>

<c:if test="${movie.movieName2!=null||movie.movieName3!=null}">
	<strong>别名　　:</strong>${movie.movieName2}/${movie.movieName3}<br/>
</c:if>
<strong>年份　　:</strong>${movie.movieYear}<br/>
<strong>国家　　:</strong>${movie.movieArea}<br/>
<strong>导演　　:</strong>${movie.movieDirector}<br/>
<strong>类型　　:</strong>${movie.movieType}<br/>
<strong>编剧　　:</strong>${movie.movieScriptwriter}<br/>
<c:if test="${movie.movieProductiondirector!=null}">
	<strong>监制　　:</strong>${movie.movieProductiondirector}<br/>
</c:if>
<c:if test="${movie.movieProducer!=null}">
<strong>制片人　:</strong>${movie.movieProducer}<br/>
</c:if>
<strong>演员表　:</strong>  
${movie.movieActors}<br />
<strong>片长　　:</strong>${movie.movieLength}分钟<br/>
<strong>详情　　:</strong>
<br/>　　${movie.movieInfo}
<br/><strong>下载链接:</strong> <br/>  
<a href="${movie.movieDownloadlink1}">${movie.movieDownloadlink1info}</a><br/>
<a href="${movie.movieDownloadlink2}">${movie.movieDownloadlink2info}</a><br/>
<a href="${movie.movieDownloadlink3}">${movie.movieDownloadlink3info}</a><br/>
<a href="${movie.movieDownloadlink4}">${movie.movieDownloadlink4info}</a><br/>
<a href="${movie.movieDownloadlink5}">${movie.movieDownloadlink5info}</a><br/>
        </div>
</div>
</body>
</html>