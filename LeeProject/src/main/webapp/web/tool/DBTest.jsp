<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>数据库测试</title>
</head>
<script type="text/javascript">
	$(function() {
		$('#type').combobox({
			onChange : function(n, o) {
				if (n == "Oracle") {
					$('#DBorInstance').textbox({
						labelPosition : 'top',
						label : '实例名:',
						prompt : '请输入或实例名',
						missingMessage : '请输入或实例名'
					})
					$('#port').textbox('setValue', "1521");
					$('#DBorInstance').textbox('setValue', "orcl");
				} else if (n == "MySQL") {
					$('#DBorInstance').textbox({
						labelPosition : 'top',
						label : '数据库名:',
						prompt : '请输入数据库名',
						missingMessage : '请输入数据库名'
					})
					$('#port').textbox('setValue', "3306");
				}
			}
		});

		$('#DBorInstance').textbox({
			labelPosition : 'top',
			label : '数据库名:',
			prompt : '请输入数据库名',
			missingMessage : '请输入数据库名'
		})

		$('.easyui-passwordbox,.easyui-textbox').textbox({
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
				$("#login").click();
			}
		};

	});
	//进入后将焦点放入用户输入框
	function onLoad() {
		$("#username").focus();
	}

	//清除表单
	function clearForm() {
		// 		$(".easyui-textbox").textbox('reset');
		$(".easyui-textbox").textbox('clear');
		$(".easyui-passwordbox").textbox('reset');
	}

	function bind() {
		$.messager.alert('提示', '因安全问题！该功能不开放', 'error');
	}

	function test() {
		var ip = $(".easyui-textbox").val();
		var port = $("#port").val();
		var DBorInstance = $("#DBorInstance").val();
		var name = $("#name").val();
		var pwd = $("#pwd").val();

		$('#DBform').form(
				'submit',
				{
					url : '${ctx}/tool/testJDBC',
					onSubmit : function() {
						$("#p").show();
						$('#p').progressbar({
							value : 1,
							text : "正在测试..."
						});
						// 		设置定时器
						var value = $('#p').progressbar('getValue');
						timer = setInterval(dis, 100);

						function dis() {
							value += 0.1;
							$('#p').progressbar('setValue', value);
							if (value == 100) {
								value = 0;
							}
						}
						if (isNull(ip) || isNull(port) || isNull(DBorInstance)
								|| isNull(name) || isNull(pwd)) {
							$("#p").hide();
							$("#warn").html('所填信息不能为空！');
							$("#warn").warn();
							return false;
						}
						if (!isIP(ip)&&ip!="localhost"){
							$("#p").hide();
							$("#warn").html('请输入正确IP！');
							$("#warn").warn();
							return false;
						}
						if (isNaN(port)) {
							$("#p").hide();
							$("#warn").html('请输入正确端口！');
							$("#warn").warn();
							return false;
						}

					},
					success : function(data) {
						var data = eval('(' + data + ')');
						if (data.status == "ok") {
							$("#p").hide();
							$("#win").html(data.info);
							$('#win').window('open');
							return;
						} else if (data.status == "error") {
							$("#p").hide();
							$("#win").html(data.info);
							$('#win').window('open');
							return;
						} else {
							$("#win").html('系统繁忙');
							$('#win').window('open');
							$("#p").hide();
							return;
						}
					}
				});
	}
</script>
<style>
#testDB input, #testDB select {
	margin: 10px;
	height: 30px;
	width: 360px;
}

#testDB {
	padding: 2%;
	background-image: url(${ctxStatic}/img/dbs.png);
	background-size: 100%, 100%;
	background-repeat: round;
	width: 30%;
	display: inline-block;
}

#DBIndex {
	padding: 5% 5% 5% 5%;
	border-radius: 33px;
	background-color: rgba(255, 255, 255, 0.6);
}

#guide {
	width:50%;
	display: inline-block;
}

.divBtn {
	width: 65px;
}
</style>

<body>
	<%@ include file="../include/header.jsp"%>

	<div id="DBIndex">
		<div id="guide">
			<h1>说明:</h1>
			此配置默认为你当前项目的 <strong>jdbc.properties</strong>文件的配置<br /> 如需测试连接性可点击<strong>测试</strong>按钮<br /> 修改数据库配置请点击<strong>绑定</strong>按钮<br /> <br />

			<h1>您当前项目的配置信息:</h1>
			<strong>数据库URL：<br /></strong>${dbconfig}<br /> <strong>数据库名：</strong>${name}<br /> <strong>数据库密码：</strong>********<br />
		</div>
		<div id="testDB">
			<form id="DBform" method="post">
				<div>
					<select class="easyui-combobox" id="type" name="type" data-options="labelPosition: 'top',label: '数据库类型:'">
						<option value="MySQL">MySQL</option>
						<option value="Oracle">Oracle</option>
					</select>
				</div>
				<div>
					<input class="easyui-textbox" id="ip" name="ip" value="${ip}" data-options="prompt:'请输入您的数据库IP', label: '数据库IP:',missingMessage:'请输入数据库IP'">
				</div>
				<div>
					<input class="easyui-textbox" id="port" name="port" value="${port}" data-options="label: '端口:',prompt:'请输入端口',missingMessage:'请输入端口'">
				</div>
				<div>
					<input id="DBorInstance" name="DBorInstance" value="${db}">
				</div>
				<div>
					<input class="easyui-textbox" id="name" name="name" value="${name}"
						data-options="iconCls:'icon-man',label: '用户名:',prompt:'请输入用户名',missingMessage:'请输入用户名'">
				</div>
				<div>
					<input class="easyui-passwordbox" id="pwd" name="pwd" value="${pwd}"
						data-options="iconCls:'icon-lock',type:'password',label: '密码:',prompt:'请输入密码',missingMessage:'请输入密码',showEye:false ">
				</div>
			</form>
			<div id="warn"></div>
			<div id="p" style="display: none;"></div>
			<br />
			<div>
				<div id="test " class="divBtn " onClick="test() ">测试</div>
				<div id="bind " class="divBtn " onClick="bind() ">绑定</div>
				<div class="divBtn " onClick="clearForm() ">重置</div>
			</div>
			
		</div>
		<div id="win" class="easyui-window" title="My Window" style="font-size:30px;padding:30px"   
        data-options="iconCls:'icon-save',
        modal:true,
        title : '你的数据库信息',
        width : 700,
        height : 500,
        closed :true,
        cache : false
        ">   
		<div id="dd"></div>

	</div>
</body>

</html>