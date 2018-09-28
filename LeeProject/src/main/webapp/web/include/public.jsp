<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static" />
<!-- 引入bootstrap -->
<%-- <script type="text/javascript" src="${ctx}/bootstrap/bootstrap.min.js"></script> --%>
<%-- <link rel="stylesheet" href="${ctx}/bootstrap/bootstrap.min.css" type="text/css" /> --%>

<!-- 引入JQuery -->
<script type="text/javascript" src="${ctxStatic}/jquery-easyui-1.5.5.2/jquery.min.js"></script>
<!-- 引入EasyUI -->
<script type="text/javascript" src="${ctxStatic}/jquery-easyui-1.5.5.2/jquery.easyui.min.js"></script>
<!-- 引入EasyUI的中文国际化js，让EasyUI支持中文 -->
<script type="text/javascript" src="${ctxStatic}/jquery-easyui-1.5.5.2/locale/easyui-lang-zh_CN.js"></script>
<!-- 引入EasyUI的样式文件-->
<link rel="stylesheet" href="${ctxStatic}/jquery-easyui-1.5.5.2/themes/default/easyui.css" type="text/css" />
<!-- 引入EasyUI的图标样式文件-->
<link rel="stylesheet" href="${ctxStatic}/jquery-easyui-1.5.5.2/themes/icon.css" type="text/css" />
<!-- 标题栏图标： -->
<link rel="icon" href="${ctxStatic}/img/naruto.ico" type="image/x-icon" />
<!-- 收藏夹图标： -->
<link rel="shortcut icon" href="${ctxStatic}/img/naruto.ico" type="image/x-icon" />
<script type="text/javascript" src="${ctxStatic}/js/quietflow.min.js"></script>
<!-- 引入JQuery.form cookie、session-->
<script type="text/javascript" src="${ctxStatic}/js/jquery.form.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.session.js"></script>

<link href="${ctxStatic}/css/public.css" rel="stylesheet" type="text/css" charset="utf-8" />
<!-- 富文本编辑器 -->
<link rel="stylesheet" href="${ctxStatic}/kindeditor/themes/default/default.css" />
<script  type="text/javascript" charset="utf-8" src="${ctxStatic}/kindeditor/kindeditor-all-min.js"></script>
<script  type="text/javascript" charset="utf-8" src="${ctxStatic}/kindeditor/lang/zh-CN.js"></script>
<script src="${ctxStatic}/kindeditor/plugins/code/prettify.js" type="text/javascript"></script>
<link href="${ctxStatic}/kindeditor/plugins/code/prettify.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		// body... 
		//    function unScroll() {
		//    var top = $(document).scrollTop();
		//    $(body).on('scroll.unable',function (e) {
		//        $(body).scrollTop(top);
		//    })
		//    }
		//    unScroll();
		var test = [ 'bouncingBalls', 'starfield', 'vortex', 'shootingLines',
				'squareFlash', 'layeredTriangles', 'cornerSpikes',
				'floatingBoxes', 'simpleGradient' ];
		var random = Math.floor(Math.random() * test.length);
		console.log(test[random]);

		var theme = '${ps.theme}';
		if ("random" == theme || theme == null || theme == "") {
			settingTheme(test[random]);
		} else {
			settingTheme(theme);
		}
	});

	function settingTheme(theme) {
		switch (theme) {
		case 'bouncingBalls':
			bouncingBalls();
			break;
		case 'starfield':
			starfield();
			break;
		case 'vortex':
			vortex();
			break;
		case 'shootingLines':
			shootingLines();
			break;
		case 'squareFlash':
			squareFlash();
			break;
		case 'layeredTriangles':
			layeredTriangles();
			break;
		case 'cornerSpikes':
			cornerSpikes();
			break;
		case 'floatingBoxes':
			floatingBoxes();
			break;
		case 'simpleGradient':
			simpleGradient();
			break;
		case 'defaultTheme':
			defaultTheme();
			break;
		default:
			simpleGradient();
			break;
		}

		function bouncingBalls(argument) {
			$(document).quietflow(
					{
						theme : "bouncingBalls",
						specificColors : [ "rgba(255, 10, 50, .5)",
								"rgba(10, 255, 50, .5)",
								"rgba(10, 50, 255, .5)", "rgba(0, 0, 0, .5)" ]
					})
		}

		function simpleGradient(argument) {
			$(document).quietflow({
				theme : "simpleGradient",
				primary : "#B066FE",
				accent : "#63E2FF"
			})
		}

		function starfield() {
			$(document).quietflow({
				theme : "starfield"
			})
		}

		function vortex() {
			$(document).quietflow({
				theme : "vortex",
				miniRadii : 40
			})
		}
		function squareFlash() {
			$(document).quietflow({
				theme : "squareFlash",
			})
		}
		function layeredTriangles() {
			$(document).quietflow({
				theme : "layeredTriangles",
			})
		}
		function cornerSpikes() {
			$(document).quietflow({
				theme : "cornerSpikes",
			})
		}
		function floatingBoxes() {
			$(document).quietflow({
				theme : "floatingBoxes",
			})
		}

		function shootingLines() {
			$(document).quietflow({
				theme : "shootingLines",
				backgroundCol : "#141C26",
				lineColor : "#05E0E0",
				lineGlow : "#00ff00"
			})
		}
		function defaultTheme() {
			$(document).quietflow({
				theme : "simpleGradient",
				primary : "white",
				accent : "white"
			})
		}
	}

	window.onload = function() {
		$(document.body).css('font-family', '${ps.font}');
	}
	function isNull(str) {
		if (str = null || "" == str.trim()) {
			return true;
		} else {
			return false;
		}
	}

	String.prototype.replaceAll = function(FindText, RepText) {
		regExp = new RegExp(FindText, "g");
		return this.replace(regExp, RepText);
	}

	$.fn.warn = function() {
		$(this).hide();
		$(this).fadeToggle(2000);
		$(this).fadeOut();
		$(this).css({
			'background-color' : 'rgba(255, 255, 255, 0.8)',
			'font-weight' : 'bold',
			'color' : 'red',
			'padding' : '6px',
			'text-align' : 'center'
		});
	}
	$.fn.divBtnDisabled = function() {
		$(this).css({
			'pointer-events' : 'none',
			'background-color' : 'gray',
			'background-image' : 'none'
		});
	}
	$.fn.divBtnEnabled = function() {
		$(this).css({
			'pointer-events' : '',
			'background-color' : '',
			'background-image' : ''
		});
	}
	function bigAlert(title, msg, icon) {
		$.messager.alert({
			width : 480,
			height : 200,
			title : title,
			msg : msg,
			icon : icon
		});
	}

	// 	验证IP
	function isIP(ip) {
    var reg = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/
    return reg.test(ip);
	} 

	// 	验证手机或座机
	function isTel(tel) {
		var reg = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$|^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$|^0\d{2,3}-?\d{7,8}$/;
		return reg.test(tel)
	}

	//校验登录名：只能输入5-20个以字母开头、可带数字、“_”、“.”的字串 
	function isRegisterUserName(s) {
		var patrn = /^[a-zA-Z]{1}([a-zA-Z0-9]|[._]){4,19}$/;
		if (!patrn.exec(s))
			return false
		return true
	}

	//校验用户姓名：只能输入1-30个以字母开头的字串 
	function isTrueName(s) {
		var patrn = /^[a-zA-Z]{1,30}$/;
		if (!patrn.exec(s))
			return false
		return true
	}

	//校验密码：只能输入6-20个字母、数字、下划线 
	function isPasswd(s) {
		var patrn = /^(\w){6,20}$/;
		if (!patrn.exec(s))
			return false
		return true
	}

	//校验普通电话、传真号码：可以“+”开头，除数字外，可含有“-” 
	function isTel(s) {
		//var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?(\d){1,12})+$/; 
		var patrn = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
		if (!patrn.exec(s))
			return false
		return true
	}

	//校验手机号码：必须以数字开头，除数字外，可含有“-” 
	function isMobil(s) {
		var patrn = /^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
		if (!patrn.exec(s))
			return false
		return true
	}

	//校验邮政编码 
	function isPostalCode(s) {
		//var patrn=/^[a-zA-Z0-9]{3,12}$/; 
		var patrn = /^[a-zA-Z0-9 ]{3,12}$/;
		if (!patrn.exec(s))
			return false
		return true
	}
</script>