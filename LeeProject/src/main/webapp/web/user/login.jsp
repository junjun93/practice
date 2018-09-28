<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/web/include/public.jsp"%>
<%@ include file="/web/include/header.jsp"%>
<title>登录</title>
<script type="text/javascript">
// 文档载入完毕就执行
$(function() {
	$("#username").focus();
	$('.easyui-passwordbox,.easyui-textbox').textbox({    
	    labelPosition: 'top',
	    labelWidth:145,
	    labelAlign:'left',
	    required:true
	})
	  if ($.cookie("rmbUser") == "true") {
	        $("#ck_rmbUser").attr("checked", true);
	        $("#username").val($.cookie("username"));
	        $("#password").val($.cookie("password"));
	    }
	//监控enter键查询
  	document.onkeydown=function(event){
        var e = event || window.event || arguments.callee.caller.arguments[0];
        if(e && e.keyCode==13){ // enter 键
        	$("#login").click();
        }
	 };
});

//记住用户名密码
function save() {
	//判断复选框是否被选中
    if ($("#ck_rmbUser").prop("checked")) {
        var str_username = $("#username").val();
        console.log(str_username);
        var str_password = $("#password").val();
        $.cookie("rmbUser", "true", { expires: 7 }); //存储一个带7天期限的cookie
        $.cookie("username", str_username, { expires: 7 });
        $.cookie("password", str_password, { expires: 7 });
    }
    else {
        $.cookie("rmbUser", "false", { expire: -1 });
        $.cookie("username", "", { expires: -1 });
        $.cookie("password", "", { expires: -1 });
    }
}

//登录方法
function login() {
		var username = $("#username").val();
		var password = $("#password").val();
		var verifyCode = $("#verifyCode").val();
		if(isNull(username)||isNull(password)){
			$("#warn").html('用户名或密码不能为空！');
			$("#warn").warn();
			return;
		}
		if(isNull(verifyCode)){
			$("#warn").html('验证码不能为空！');
			$("#warn").warn();
			return;
		}
// 		$('#p').show();
// 		$('#p').progressbar({ 
// 			value: 10 ,
// 			text:"正在登录..."
// 			}); 
// // 		设置定时器
// 		var value = $('#p').progressbar('getValue'); 
// 		timer = setInterval(dis, 100);
// 		function dis(){
// 			value +=5;
// 			$('#p').progressbar('setValue', value); 
// 			if (value==100) {
// 				value=100;
// 			}
// 		}
		
		　$.messager.progress({title:'提示',
	　　　　　　　　msg:'欢迎回来！'+username,
	　　　　　　　 	text:'登录中...',
	　　　　　　　　interval:'2000'
	　　　　});
		$.post("${ctx}/user/login", {
			"username":username,
			"password":password,
			"verifyCode":verifyCode
		},function(dataobj){
			if (dataobj.success == "error"){
				$.messager.progress('close');
				$("#warn").html(dataobj.message);
				$("#warn").warn();
				return;
			}else if(dataobj.success == "ok"){
				$.messager.progress('close');
				save();
				window.location.href = "${ctx}/user/personal";
// // 				设置定时器
// 				var time = 3;
// 				timer = setInterval(dis, 1000);
// 				function dis(){
// 					$("#dd").html("正在跳转到个人中心...点击确定可快速跳转<br/>"+time+"秒后进入登录页面");
// 					time--;
// 					if (time==0) {
// 						window.location.href = "${ctx}/user/personal";
// 						return;
// 					}
// 				}
// 				$('#dd').dialog({    
// 				    title: '登录成功！',    
// 				    width: 400,    
// 				    height: 200,    
// 				    closed: false,    
// 				    cache: false,    
// 				    modal: true,
// 				    buttons:[{
// 						text:'确定',
// 						handler:function(){
// 							window.location.href = "${ctx}/user/personal";
// 						}
// 					},{
// 						text:'关闭',
// 						handler:function(){
// 							$('#dd').dialog('close');
// 						}

// 					}]
// 				}); 
				clearForm();
				return;
// 				$.messager.alert('提示', dataobj.message, 'info');
// 	      	 	window.location.href = "${ctx}/user/success";
	        }else if(dataobj.success == "error2"){
	        	$.messager.progress('close');
	        	$("#warn").html(dataobj.message);
	        	$("#warn").warn();
	        	return;
	        }else if(dataobj.success == "error3"){
	        	$.messager.progress('close');
	        	$("#warn").html(dataobj.message);
	        	$("#warn").warn();
	        	return;
	        }
			else{
				$.messager.progress('close');
				$("#warn").html('系统繁忙');
				$("#warn").warn();
	        	return;
		}
		},'json');
	}
	//清除表单
function clearForm(){
	$(".easyui-textbox").textbox('clear');
}
	
function genTimestamp() {  
    var time = new Date();  
    return time.getTime();  
}  

function changeCode() {  
    $("#verifyCodeImage").attr("src", "${ctx }/main/getVerifyCode?t=" + genTimestamp());  
} 

</script>
<style>
#username, #password {
	margin: 10px;
	height: 25px;
	width: 300px;
}

#loginIndex { /**样式的名字 对应class=xxx**/
	width: 300px;
	border-radius: 33px;
	height: 40%;
	padding: 80px;
	position: absolute;
	left: 30%;
    top: 20%;
	background-color: rgba(240, 255, 255, 0.7);
}
</style>
<body>
	<div id="loginIndex">
		<div>
			<input class="easyui-textbox" id="username"
				data-options="iconCls:'icon-man',
	prompt:'请输入您的用户名', 
	label: '用户名:',
	type:'text',
	missingMessage:'请输入用户名'
	">
		</div>
		<div>
			<input class="easyui-passwordbox" id="password"
				data-options="iconCls:'icon-lock',
	type:'password',
	label: '密码:',
	prompt:'请输入您的密码',
	missingMessage:'请输入密码',
	revealed:false,
	showEye:false 
	">
		</div>
		<input type="checkbox" class="checkbox" id="ck_rmbUser">自动登录
		<div>
			<br>
			<div id="code">
				<input type="text" style="width: 150px; height: 30px;" id="verifyCode" name="user_input_verifyCode" placeholder="验证码" maxlength="4" /> <img
					alt="点击更换" title="点击更换" style="width: 120px; height: 38px; margin-bottom: -13px;" src="${ctx }/main/getVerifyCode"
					style="width: 80px;height:40px;" id="verifyCodeImage" onclick="changeCode()";>
			</div>
			<div id="warn"></div>
			<div id="p" style="display: none;"></div>
			<br/>
				<div id="login" class="divBtn" onClick="login()">登录</div>
					<div class="divBtn" onClick="clearForm()">重置</div>
		</div>
		<div id="dd"></div>
		<br/> <span>没有账号？</span> <a href="showRegister" style="color: #eb7350; text-shadow: white 0.1em 0.1em 0.2em;">立即注冊</a>
	</div>
</body>
