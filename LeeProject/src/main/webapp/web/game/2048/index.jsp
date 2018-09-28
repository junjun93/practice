<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8" />
<%@ include file="/web/include/public.jsp"%>
<title>2048</title>

<link rel="stylesheet" href="${ctx}/web/game/2048/css/fiame.css" />
<script type="text/javascript" src="${ctx}/web/game/2048/js/frame.js"></script>

</head>
<body>
<%@ include file="/web/include/header.jsp"%>
<section id="section1">
	<h1>2048:wsad控制方向</h1>
	<h2 class="h2_1">得--分</h2>
	<h2 class="h2">模式选择:</h2>
	<div id="game">
	</div>
	<div class="head clear">
		<div class="scoreShow left">
			<span>Score:</span>
			<!--分数栏-->
			<span id="score"></span>
		</div>
		<div class="selction right" onClick="getModel(event)">
			<a href="#" class="model" value="3">3X3</a>
			<a href="#" class="model" value="4">4X4</a>
			<a href="#" class="model" type="button">5X5</a>
			<a href="#" class="model" type="button">6X6</a>
		</div>
	</div>
	<div id="gridPanel"></div>
	<div id="gameover">
		<h1 id="Score"></h1>
		<a href="#" id="again" onClick="obj.gameStart()">Try again</a>
	</div>
	<div class="button">
		<button class="button1 button2" id="buton1">↑</button>
		<button class="button1" id="buton2">←</button>
		<button class="button1" id="buton3">↓</button>
		<button class="button1" id="buton4">→</button>
	</div>
</section>
<audio src="${ctx}/web/game/2048/mp3/winner.mp3" id="winner" controls   hidden="true">
<audio src="${ctx}/web/game/2048/mp3/512.mp3"    id="a512" controls    hidden="true">
<audio src="${ctx}/web/game/2048/mp3/lose.mp3"    id="lose" controls    hidden="true">
<audio src="${ctx}/web/game/2048/mp3/2.mp3"      id="a2" controls      hidden="true">
<audio src="${ctx}/web/game/2048/mp3/1024.mp3"   id="a1024" controls   hidden="true">

</body>
<!--  <script language="javascript" type="text/javascript">
        function autoPlay() {
            var myAuto = document.getElementById('myaudio');
            myAuto.play();
        }
        function closePlay() {
            var myAuto = document.getElementById('myaudio');
            myAuto.pause();
            myAuto.load();
        }
 </script> -->
<script>
</script>
<div style="text-align:center;">
<p>游戏原链接：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
</html>