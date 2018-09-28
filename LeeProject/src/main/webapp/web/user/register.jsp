<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/web/include/public.jsp"%>
<%@ include file="/web/include/header.jsp"%>
<title>注册</title>
<script>

$(function(){ 
	$(".easyui-textbox").textbox('clear');
	$('.easyui-passwordbox,.easyui-textbox').textbox({    
	    labelPosition: 'top',
	    labelWidth:145,
	    labelAlign:'left',
	    required:true
	})
});


function register() {
		var val =$(".easyui-textbox").val();
		var username = $("#username").val();
		var password = $("#password").val();
		var password2 = $("#password2").val();
		var tel = $("#tel").val();
		var gender = $("input[name='gender']:checked").val();
		if (isNull(val)||gender==null) {
			$("#warn").html('所填信息不能为空！');
			$("#warn").warn();
			return;
		}else if (password!=password2) {
			$("#warn").html('两次密码不一致！');
			$("#warn").warn();
			return;
		}else if (!(/^1[3-8]+\d{9}$/.exec(tel))) {
			$("#warn").html('手机号码格式不正确！');
			$("#warn").warn();
			return;
		}else if (username.length<3||username.indexOf(" ")!=-1) {
			$("#warn").html('用户名长度不能小于3或包含非法字符！');
			$("#warn").warn();
			return;
		}
		$("#warn").hide();
		$.post("${ctx}/user/register", {
			"username":username,
			"password":password,
			"tel":tel,
			"gender":gender
		},function(dataobj){
			if (dataobj.status=="ok") {
// 				设置定时器
				var time = 3;
				timer = setInterval(dis, 1000);
				function dis(){
					$("#dd").html("正在跳转到登录页面...点击确定可快速跳转<br/>"+time+"秒后进入登录页面");
					time--;
					if (time==0) {
						window.location.href = "${ctx}/user/showLogin";
						return;
					}
				}
				$('#dd').dialog({    
				    title: '注册成功！',    
				    width: 400,    
				    height: 200,    
				    closed: false,    
				    cache: false,    
				    modal: true,
				    buttons:[{
						text:'确定',
						handler:function(){
							window.location.href = "${ctx}/user/showLogin";
						}
					},{
						text:'关闭',
						handler:function(){
							$('#dd').dialog('close');
						}

					}]
				}); 
				clearForm();
				return;
			}else if (dataobj.status=="error") {
				$("#warn").html(dataobj.info);
				$("#warn").warn();
			}else if (dataobj.status=="error2") {
				$("#warn").html(dataobj.info);
				$("#warn").warn();
			}
			else{
			$.messager.alert('提示', '系统繁忙');
			$("#warn").warn();
	      	return;
			}
		},'json');
	};
	
	$.extend($.fn.validatebox.defaults.rules, {
//	 	用户名长度验证
		minLength : {
			//param表示中括号的参数
			//value表示输入的值
			validator : function(value, param) {
				return value.length >= param[0];
			},
			// 	        如果验证不过显示的信息
			message : '长度小于3！'
		},
// 	确认密码验证
	checkPwd : {
		validator : function(value, param) {
			return value == $(param[0]).val();
		},
		message : '两次密码不一致！'
	},
    checkPhone: { //验证手机号   
        validator: function(value, param){ 
         return /^1[3-8]+\d{9}$/.test(value);
        },    
        message: '请输入正确的手机号码。'   
    }
	});
function clearForm(){
		$(".easyui-textbox").textbox('reset');
	}
</script>
<style>
#registerIndex input {
	margin: 10px;
	height: 25px;
	width: 300px;
}

#registerIndex input[name='gender'] {
	height: 25px;
	width: 40px;
}

#index {
	line-height: 32px;
	margin-right: 0px;
	position: absolute;
	right: 10px;
}

#registerIndex { /**样式的名字 对应class=xxx**/
	font-weight:bold;
	width: 300px;
	border-radius: 33px;
    height: 400px;
    padding: 80px;
    position: absolute;
        left: 30%;
    top: 20%;
    background-color: rgba(240, 255, 255, 0.7);
}
</style>
<body>
	<div id="registerIndex">
			<div>
				<input class="easyui-textbox" id="username"
				onkeyup="this.value=this.value.replace(/^ +| +$/g,'')"
					data-options="iconCls:'icon-man',
	prompt:'请输入您的用户名',
	label: '用户名:',
	type:'text',
	missingMessage:'请输入用户名',
	validType:'minLength[3]'">
			</div>
			<div>
				<input class="easyui-textbox" id="password"
					data-options="iconCls:'icon-lock',
	type:'password',
	label: '密码:',
	prompt:'请输入您的密码',
	missingMessage:'请输入密码'
	">
			</div>
			<div>
				<input class="easyui-textbox" id="password2"
					data-options="iconCls:'icon-lock',
	type:'password',
	label: '确认密码:',
	prompt:'请再输入您的密码',
	missingMessage:'请输入密码',
	validateOnBlur:true"
	validType="checkPwd['#password']"">
			</div>
			<div>
				<input class="easyui-textbox" id="tel"
					data-options="
	label: '电话:',
	prompt:'请输入您的电话',
	missingMessage:'请输入电话'"
	validType="checkPhone"
	>
			</div>
			<div>
				性别：<br/>
				 <input type="radio" name="gender" value="1" /> 男<input
					type="radio" name="gender" value="0" />女
			</div>
			<div>
			<div id="warn"></div> 
							<div id="register" class="divBtn" onClick="register()">注冊</div>
					<div class="divBtn" onClick="clearForm()">重置</div>
			</div>
			<div id="dd"></div>
	</div>
</body>
