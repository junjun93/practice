<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>Mybatis代码生成工具</title>
</head>
<script type="text/javascript">
	$(function() {
		$('#port').textbox('setValue', "3306");
		$('.easyui-passwordbox,.easyui-textbox').textbox({
			labelPosition : 'left',
			labelWidth : 160,
			width : 600,
			height : 30,
			required : true
		})
		$('.easyui-combobox').combobox({
			labelPosition : 'left',
			labelWidth : 160,
			width : 600,
			height : 30,
			required : true
		})
		$('#type').combobox({
			onChange : function(n, o) {
				if (n == "Oracle") {
					$('#DBorInstance').textbox({
						labelPosition : 'left',
						label : '实例名:',
						prompt : '请输入或实例名',
						missingMessage : '请输入或实例名'
					})
					$('#port').textbox('setValue', "1521");
					$('#DBorInstance').textbox('setValue', "orcl");
				} else if (n == "MySQL") {
					$('#DBorInstance').textbox({
						labelPosition : 'left',
						label : '数据库名:',
						prompt : '请输入数据库名',
						missingMessage : '请输入数据库名'
					})
					$('#port').textbox('setValue', "3306");
				}
			}
		});
		//监控enter键查询
		document.onkeydown = function(event) {
			var e = event || window.event
					|| arguments.callee.caller.arguments[0];
			if (e && e.keyCode == 13) { // enter 键
				$("#generate").click();
			}
		};

	});

	function generate() {
		var ip = $(".easyui-textbox").val();
		var port = $("#port").val();
		var DBorInstance = $("#DBorInstance").val();
		var name = $("#name").val();
		var pwd = $("#pwd").val();
		var tableName = $("#tableName").val();
		var domainObjectName = $("#domainObjectName").val();
		if (isNull(ip) || isNull(port) || isNull(DBorInstance) || isNull(name)
				|| isNull(pwd) || isNull(tableName) || isNull(domainObjectName)) {
			$("#warn").html('所填信息不能为空！');
			$("#warn").warn();
			return false;
		}
		if (!isIP(ip) && ip != "localhost") {
			$("#warn").html('请输入正确IP！');
			$("#warn").warn();
			return false;
		}
		if (isNaN(port)) {
			$("#warn").html('请输入正确端口！');
			$("#warn").warn();
			return false;
		}
		$('#generatorForm').form('submit', {
			url : '${ctx}/tool/generator',
			onSubmit : function() {
			},
			success : function(data) {
				$('#generate').divBtnDisabled();
				var data = eval('(' + data + ')');
				if (data.status == "ok") {
					$.messager.alert('提示','生成完毕！'); 
					$('#downloadZIP').show();
					$('#downloadZIP').click(function() {
						var fileName = data.fileName;
						window.location.href = "${ctx}/tool/download?filename=" +
							fileName;
					});
					$('#generate').divBtnEnabled();
					return;
				} else if (data.status == "error") {
					$("#win").html(data.info);
					$('#win').window('open');
					$('#generate').divBtnEnabled();
					return;
				} else {
					$("#win").html('系统繁忙');
					$('#win').window('open');
					$('#generate').divBtnEnabled();
					return;
				}
			}
		});
	}
</script>
<style>
#generatorForm>div {
	margin: 10px;
	height: 30px;
}

#generator {
	padding: 2%;
	background-size: 100%, 100%;
	background-repeat: round;
	display: inline-block;
}

#DBIndex {
	padding: 3% 0 3% 3%;
	border-radius: 33px;
	background-color: rgba(255, 255, 255, 0.6);
}

#guide {
	width: 30%;
	padding: 2%;
	display: inline-block;
	position: relative;
	bottom: 220px;
}

.divBtn {
	width: 100px;
	margin: 10px 20px;
}

.exam {
	color: brown;
}
</style>

<body>
	<%@ include file="../include/header.jsp"%>

	<div id="DBIndex">
		<div id="guide">
			<h2 style="text-align: center;">说明</h2>
			<p>1，生成的代码有JavaBean、Dao接口和Mapper的XML文件,并打包成ZIP文件提供下载</p>
			<p>2，确保数据库您本机可以连通且存在该表</p>
			<p>3，请正确选择或填写相应的信息</p>
			<p>4，请注意区分大小写</p>
			
		</div>
		<div id="generator">
			<form id="generatorForm" method="post">
				<h2 style="text-align: center;">Mybatis代码生成工具</h2>
				<div>
					<select class="easyui-combobox" id="type" name="type" data-options="label: '数据库类型:'">
						<option value="MySQL">MySQL</option>
						<option value="Oracle">Oracle</option>
					</select>
				</div>
				<div>
					<input class="easyui-textbox" id="ip" name="ip" value="localhost" data-options="prompt:'请输入您的数据库IP', label: '数据库IP:',missingMessage:'请输入数据库IP'">
					<a class="exam">例:localhost/192.168.xxx.x</a>
				</div>
				<div>
					<input class="easyui-textbox" id="port" name="port" value="3306" data-options="label: '端口:',prompt:'请输入端口',missingMessage:'请输入端口'"> <a
						class="exam">例:1521/3306</a>
				</div>
				<div>
					<input class="easyui-textbox" id="DBorInstance" name="DBorInstance"
						data-options="label : '数据库名:',
			prompt : '请输入数据库名',
			missingMessage : '请输入数据库名'"> <a class="exam">例:mysql/orcl</a>
				</div>
				<div>
					<input class="easyui-textbox" id="name" name="name" data-options="iconCls:'icon-man',label: '用户名:',prompt:'请输入用户名',missingMessage:'请输入用户名'">
					<a class="exam">例:root/SYS/admin</a>
				</div>
				<div>
					<input class="easyui-passwordbox" id="pwd" name="pwd"
						data-options="iconCls:'icon-lock',type:'password',label: '密码:',prompt:'请输入密码',missingMessage:'请输入密码',showEye:false ">
				</div>
				<div>
					<input class="easyui-textbox" id="tableName" name="tableName" data-options="prompt:'请输入您要生成的表名', label: '要生成的表名:',missingMessage:'要生成的表名'">
					<a class="exam">例:T_USER</a>
				</div>
				<div>
					<input class="easyui-textbox" id="domainObjectName" name="domainObjectName"
						data-options="label: 'Model名:',prompt:'请输入Model名',missingMessage:'请输入Model名'"> <a class="exam">例:User</a>
				</div>
				<div>
					<div id="warn"></div>
					<br />
					<div id="generate" style="margin-left: 200px;" class="divBtn " onClick="generate() ">生成代码</div>
					<div id="downloadZIP" class="divBtn" style="display: none;">下载代码</div>
				</div>
			</form>
		</div>


	</div>
	<div id="win" class="easyui-window" title="My Window" style="font-size: 30px; padding: 30px"
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