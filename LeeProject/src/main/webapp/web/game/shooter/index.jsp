<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<%@ include file="/web/include/public.jsp"%>
<meta name=viewport content="width=device-width, initial-scale=1">
<title>飞机大战</title>

<style type="text/css" media="screen">
	*{
		margin: 0;
		padding: 0;
	}
	img{
		border:0;
	}
	ol, ul ,li{list-style: none;}


		html,body{
			/* background: url('img/bj.jpg'); */
			height:100%;
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
			-khtml-user-select: none;
			user-select: none;
			font-family:sans-serif;
		}
	  .layout{
			width:100%;
			height:100%;
			margin: 0 auto;
			background: url('${ctx}/web/game/shooter/img/bj.jpg') center bottom /100% auto;
			/* background:#505149; */
			position: relative;
			overflow: hidden;
			animation:movebg 3000s linear infinite;
			-moz-animation:movebg 3000s linear infinite; /* Firefox */
			-webkit-animation:movebg 3000s linear infinite; /* Safari and Chrome */
			-o-animation:movebg 3000s linear infinite; /* Opera */

		}
		.plane{
			width:110px;
			height:90px;
			/* background:#fff; */
			background:url('${ctx}/web/game/shooter/img/P.png') 0 -101px no-repeat;
			position: absolute;
			bottom:0;
			left:50%;
			cursor:pointer;
		}
		.b1{
			width:5px;
			height:15px;
			border-radius:50% 50% 5px 5px;
			background:#fff;
			position: absolute;
			top:-50px;
			left:50%;
		}
		.enemy0{
			width:126px;
			height:81px;
			/* background:yellow; */
			background:url('${ctx}/web/game/shooter/img/P.png') -377px 0 no-repeat;
			position: absolute;
			top:-70px;
			left:20px;
		}
		.enemy1{
			width:108px;
			height:81px;
			/* background:green; */
			background:url('img/P.png') 0 0 no-repeat;
			position: absolute;
			top:-150px;
			left:600px;
		}
		.enemy2{
			width:126px;
			height:87px;
			/* background:blue; */
			background:url('${ctx}/web/game/shooter/img/P.png') -242px 0 no-repeat;
			position: absolute;
			top:-400px;
			left:80px;
		}
		.enemy3{
			width:120px;
			height:101px;
			/* background:red; */
			background:url('${ctx}/web/game/shooter/img/P.png') -114px 0 no-repeat;
			position: absolute;
			top:-60px;
			left:510px;
		}
		.b2{
			width:10px;
			height:10px;
			position: absolute;
			border-radius:50%;
			left:50%;
			bottom: -50px;
			background:#fff;
		}

		.score{
			display: none;
			padding: 10px 15px;
			font-size:30px;
			font-weight:bold;
			color:#99B2D6;
			background:#031540;
			border:5px solid #425579;
			border-radius:0 50px 50px 0;
			position: absolute;
			top:20px;
			left:20px;
			z-index:1000000;

			/* background:red; */
		}

		@keyframes movebg
		{
			from {background-position:0 10000%;} to {background-position:0 0%;}
		}

		@-moz-keyframes movebg /* Firefox */
		{
			from {background-position:0 10000%;} to {background-position:0 0;}
		}

		@-webkit-keyframes movebg /* Safari and Chrome */
		{
			from {background-position:0 10000%;} to {background-position:0 0%;}
		}

		@-o-keyframes movebg /* Opera */
		{
			from {background-position:0 10000%;} to {background-position:0 0;}
		}
		#start{
			width: 100%;
			height:100%;
			background:rgba(0, 0, 0, 0.7);
			position: absolute;
			top:0;
			left:0;
		}
		#startBtn{
			background:blue;
			color: #fff;
			font-size:50px;
			margin:100px 0 0 -115px;
			padding: 10px 30px;
			border:5px solid #fff;
			border-radius:50px;
			position: absolute;
			top:50%;
			left:50%;
			outline:none;
			cursor:pointer;
		}
		#name-over{
			font-family:'微软雅黑',sans-serif;
			width:100%;
			padding: 120px 0 10px;
			margin: -200px 0 0 0;
			font-size:50px;
			font-weight:bold;
			text-align:center;
			color:rgba(106,124,197,1);
			line-height:70px;
			background:rgba(106,124,197,0.5) url('img/P1.png') center 20px no-repeat;
			position: absolute;
			top:50%;
			left:0;
		}
</style>

</head>
<body>

<audio id="bgmuc" autoplay loop src="${ctx}/web/game/shooter/audio/bjyy.mp3"></audio>
<audio id="fire" loop src="${ctx}/web/game/shooter/audio/9519.mp3"></audio>
<audio id="boom" src="${ctx}/web/game/shooter/audio/baoza.mp3"></audio>
<audio id="bigboom" src="${ctx}/web/game/shooter/audio/bigboom.mp3"></audio>
<div class="layout" id="layout"></div>
<div class="score">得分：
	<span id="score">0</span>
</div>
<div id="start">
	<div id="name-over"><i>飞机大战</i><p>0</p></div>
	<input id="startBtn" type="button" name="mystartBtn" value="START">
</div>

<script src="${ctx}/web/game/shooter/js/main.js"></script>

<div style="text-align:center;">
<p>游戏原链接：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
</div>
	<%@ include file="/web/include/header.jsp"%>
</body>
</html>