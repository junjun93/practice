<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>工具中心</title>
</head>
<script type="text/javascript">
	$(function() {
		// 		$('#of').switchbutton(
		// 				onChange:function(checked){
		// 			$('#convert').slideToggle();
		// 				}
		// 		});
		$('#ipOF').switchbutton({
			checked : false,
			onChange : function(checked) {
				if (checked == true) {
					$('#ipResult').slideDown();
					return;
				}
				if (checked == false) {
					$('#ipResult').slideUp();
					return;
				}
			}
		})
	});


	// 	人民币大写转换
	function toChinaUpperMoney() {
		var param = $('#toChinaUpperMoney textarea:eq(0)').val();
		var ret = /^[0-9]+$/;
		if (!ret.test(param)) {
			alert("请输入正确数字货币值！！！");
			return false;
		}
		$.get("${ctx}/tool/toChinaUpperMoney/" + param + "", function(data) {
			$('#toChinaUpperMoney textarea:eq(1)').html(data);
		});
	}
	// 	英汉翻译
	function translation() {
		var param = $('#translation textarea:eq(0)').val();
		var ret = /^[a-zA-Z]+$/;
		if (!ret.test(param)) {
			alert("请输入正确英文单词！！！");
			return false;
		}
		$.get("${ctx}/tool/translation/" + param + "", function(data) {
			$('#translation textarea:eq(1)').html(data);
		});
	}
	// 	生成Base64
	function generateBase64() {
		var param = $('#generate textarea:eq(0)').val();
		$.get("${ctx}/tool/generateBase64/" + param + "", function(data) {
			$('#generate textarea:eq(1)').html(data);
		});
	}
	// 	解析Base64
	function parseBase64() {
		var param = $('#parse textarea:eq(0)').val();
		$.get("${ctx}/tool/parseBase64/" + param + "", function(data) {
			$('#parse textarea:eq(1)').html(data);
		});
	}

// 	获取IP信息
	function getInfoByIP() {
		var ip = $("#ip").val();
		// 		if (!isIp(ip) || isNull(ip)) {
		if (isNull(ip)) {
			alert("请输入IP！");
			return;
		}
		$.get("${ctx}/tool/getInfoByIP", {
			"ip" : ip
		}, function(data) {
			$('#query').html("正在查询");
			var data = eval('(' + data + ')').data;
			// 				$('#ipResult').slideDown();
			$('#ipOF').switchbutton('check');
			$('#ipResult').html(
					"IP-" + data.ip + "<br/>" + "国家-" + data.country + "<br/>"
							+ "地区-" + data.area + "<br/>" + "范围-" + data.region
							+ "<br/>" + "市-" + data.city + "<br/>" + "县-"
							+ data.county + "<br/>" + "网络服务提供者-" + data.isp
							+ "<br/>" + "国家代号-" + data.country_id + "<br/>"
							+ "地区代号-" + data.area_id + "<br/>" + "范围代号-"
							+ data.region_id + "<br/>" + "市代号-" + data.city_id
							+ "<br/>" + "县代号-" + data.county_id + "<br/>"
							+ "网络服务提供者代号-" + data.isp_id + "<br/>");
			$('#query').html("查询");
		}, 'json');
	}
</script>
<style>
#toolIndex {
	padding: 50px;
}

#toolIndex>div {
	margin: 10px;
	padding: 10px;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.9);
	width: 60%;
}

#toolIndex a {
	font-size: 20px;
	margin: 35px;
	color: black;
}

#toolIndex a:hover {
	border: 5px solid red;
}

textarea {
	height: 60px;
}

input[type="button"], button {
	width: 80px;
	vertical-align: top;
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
	letter-spacing: 1px;
	background: #38f;
	border: 0;
	box-sizing: border-box;
	border-bottom: 1px solid #2d78f4;
	cursor: pointer;
}
</style>

<body>
	<%@ include file="../include/header.jsp"%>
	<div id="toolIndex">
		<div>
			<a href="${ctx}/tool/DBTest">数据库测试工具</a>
		</div>
		<div>
			<a href="${ctx}/tool/ExceltoSQL">SQL生成工具</a>
		</div>
		<div>
			<a href="${ctx}/tool/mybatisGenerator">mybatis代码生成器</a>
		</div>
		<div>
			获取IP信息-
			<div id="ipOF"></div>
			<br> <input id="ip">
			<button id="query" onclick="getInfoByIP();">查询</button>
			<div id="ipResult" style="display: none;"></div>
		</div>
			
			<div id="toChinaUpperMoney">
			<span>人民币大写转换-</span>
				<textarea></textarea>
				<button onclick="toChinaUpperMoney();">转换</button>
				<textarea></textarea>
			</div>
			<div id="generate">
			<span>Base64生成-</span>
				<textarea></textarea>
				<button onclick="generateBase64();">生成</button>
				<textarea></textarea>
			</div>
			
			<div id="parse">
			<span>Base64解析-</span>
				<textarea></textarea>
				<button onclick="parseBase64();">解析</button>
				<textarea></textarea>
			</div>
			
			<div id="translation">
			<span>英汉翻译-</span>
				<textarea></textarea>
				<button onclick="translation();">翻译</button>
				<textarea style="width: 300px;"></textarea>
			</div>
	</div>
</body>

</html>