<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/web/include/public.jsp"%>
<%@ include file="/web/include/header.jsp"%>
<title>个人中心</title>
<script type="text/javascript">
	$(function() {
		$.get("${ctx}/main/getPhotos");
		//隐藏按钮和密码域
		$('#btn').hide();
		$('#pwd').hide();
		$('#editGender').hide();
		$('#personIndex h1').html("个人信息");
		$('.easyui-textbox,.easyui-combobox').textbox({
			readonly : true,
			labelPosition : 'before',
			labelWidth : 145,
			labelAlign : 'left'
		});
		$(".easyui-textbox").textbox('reset');
		$("#logout").click(function() {
			$.messager.confirm('确认', '您确认退出登录吗？', function(r) {
				if (r) {
					window.location.href = "${ctx}/user/exit";
					$.messager.alert('提示', '注销成功');
				}
			});
		});
	});

	//	修改信息
	function editInfo() {
		// 	$('#personIndex').show();
		$("#save").click(function() {
			saveInfo();
		});
		$('#editGender').show();
		$("#btn").show();

		$('#lookGender').hide();
		$('#personIndex #noEdit').hide();
		$('#pwd').hide();

		$('#personIndex h1').html("修改信息");
		$('.easyui-textbox,.easyui-combobox').textbox('readonly', false);
		$('#createTime').hide();
		$('#lastLoginTime').hide();
		$('#lastUpdateTime').hide();
		$('#birthday').datebox({
			label : '生日',
			labelPosition : 'before',
			labelWidth : 145,
			labelAlign : 'left'
		});

	}

	// 	修改密码
	function editPwd() {
		$('#win input').css('margin-left', '30px');
		$('#win').window({
			title : '修改密码',
			width : 450,
			height : 600,
			openAnimation : 'show'
		});
	}

	// 	修改头像
	function editPhoto() {
		$('#win2').window({
			title : '修改头像',
			width : 1300,
			height : 600,
			openAnimation : 'show',
			zIndex : 99
		});
		var photoURL = "";
		$('#win2 img').click(function() {
			var checkedAlt = $(this).attr('alt');
			var checkedSrc = $(this).attr('src');
			$('#myPhoto').attr('src', checkedSrc);
			$('#myPhoto').attr('alt', checkedAlt);
			photoURL = $(this).attr('alt');
		});
		$("#savePhoto").click(
				function() {
					$.post("${ctx}/user/updatePhoto", {
						"photoURL" : photoURL
					}, function(dataobj) {
						$.messager.alert('提示', '修改头像为<strong>'
								+ photoURL.substring(0, photoURL.length - 4)+"</strong>");
						// 				$('.easyui-linkbutton').linkbutton('disable');
						$("#photoWarn").html("修改头像成功！");
						return;
					});
				});
	}

	//保存表单
	function saveInfo() {
		var username = $("#username").val();
		var tel = $("#tel").val();
		var gender = $("input[name='gender']:checked").val();
		var birthday = $("#birthday").datebox('getValue');
		var email = $("#email").val();
		var address = $("#address").val();
		var job = $("#job").val();
		var school = $("#school").val();
		var qq = $("#qq").val();
		var company = $("#company").val();
		var country = $("#country").val();
		var info = $("#info").val();
		if (isNull(username)) {
			$.messager.alert('提示', '用户名不能为空！', 'info');
			$("#username").focus();
			return;
		}
		$.messager.confirm('确认', '您确认保存信息吗？', function(r) {
			if (r) {
				$.post("${ctx}/user/update", {
					"username" : username,
					"tel" : tel,
					"gender" : gender,
					"birthday" : birthday,
					"email" : email,
					"address" : address,
					"job" : job,
					"school" : school,
					"qq" : qq,
					"company" : company,
					"info" : info,
					"country" : country

				}, function(dataobj) {
					if (dataobj.status == "ok") {
						$('.easyui-linkbutton').linkbutton('disable');
						$.messager.alert('提示', dataobj.info);
						window.location.reload();
						return;
					} else if (dataobj.status == "error") {
						$.messager.alert('提示', dataobj.info, 'info');
					} else {
						$.messager.alert('提示', dataobj.info, 'info');
						return;
					}
				}, 'json');
			}
		});
	}

	//保存密码
	function savePwd() {
		var password = $("#password").val();
		var newPassword = $("#newPassword").val();
		var newPassword2 = $("#newPassword2").val();
		if (isNull(password) || isNull(newPassword) || isNull(newPassword2)) {
			$("#warn1").html("密码不能为空！");
			$("#warn1").warn();
			return;
		} else if (newPassword != newPassword2) {
			$("#warn1").html("两次密码不一致！");
			$("#warn1").warn();
			return;
		}
		$.post("${ctx}/user/updatePwd", {
			"password" : password,
			"newPassword" : newPassword
		}, function(dataobj) {
			if (dataobj.status == "ok") {
				if (password == newPassword && newPassword == newPassword2) {
					$("#warn1").html("密码没有变动，无需修改！");
					$("#warn1").warn();
					return;
				}
				$('.easyui-linkbutton').linkbutton('disable');
				$("#warn1").html("修改成功！");
				$("#warn1").warn();
				window.location.reload();
				return;
			} else if (dataobj.status == "error") {
				$("#warn1").html("原密码不正确!");
				$("#warn1").warn();
				return;
			} else {
				$("#warn1").html("系统繁忙！");
				$("#warn1").warn();
				return;
			}
		}, 'json');
	}
	//重置表单
	function reset() {
		$(".easyui-textbox").textbox('reset');
	}
</script>
<style>
#nav div:hover {
	background: #00FF00;
	font-size: larger;
	color: #333333;
}

#nav div {
	cursor: pointer;
	text-align: center;
	font-size: 20px;
	padding: 20px;
	border: 1px solid #96c2f1;
	background: #eff7ff;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}

#nav {
	padding: 20px;
	/*     background: gray; */
	position: absolute;
	left: 30%;
	top: 50%;
	width: 280px;
	margin-top: -300px;
	margin-left: -450px;
	border-radius: 33px;
}

#personIndex { /**样式的名字 对应class=xxx**/
	background-size: 100%, 100%;
	background-repeat: round;
	position: absolute;
	padding: 35px;
	left: 30%;
	top: 8%;
	border-radius: 33px;
	background-color: rgba(240, 255, 255, 0.8);
}

#win input {
	width: 350px;
	border-radius: 5px;
}

.easyui-textbox, .easyui-passwordbox ,.easyui-combobox{
	padding: 10px;
	width: 400px;
}
</style>
<body>
	<div id="nav">
		<div id="personalInfo" onclick="window.location.reload();">个人信息</div>
		<div id="editInfo" onclick="editInfo()">修改信息</div>
		<div id="editPhoto" onclick="editPhoto()">修改头像</div>
		<div id="editPwd" onclick="editPwd()">修改密码</div>
		<div id="logout">退出登录</div>
	</div>

	<div id="personIndex">
		<br>
		<div id="canEdit">
			<input class="easyui-textbox" id="username" value="${user.username}" data-options="label: '用户名:'"><br>
			<div id="lookGender">
				<c:choose>
					<c:when test="${user.gender==1}">
						<input class="easyui-textbox" id="gender" value="男" data-options="label: '性别:'">
						<br>
					</c:when>
					<c:otherwise>
						<input class="easyui-textbox" id="gender" value="女" data-options="label: '性别:'">
						<br>
					</c:otherwise>
				</c:choose>
			</div>


			<div id="editGender">
				<c:choose>
					<c:when test="${user.gender==1}">
				性别：&emsp;&emsp;&emsp;&emsp;&emsp;
				 <input type="radio" name="gender" value="1" checked="checked" /> 男
				 <input type="radio" name="gender" value="0" />女
			
			 </c:when>
					<c:otherwise>  
                       性别：&emsp;&emsp;&emsp;&emsp;&emsp;
				 <input type="radio" name="gender" value="1" /> 男<input type="radio" name="gender" value="0" checked="checked" />女
                         </c:otherwise>
				</c:choose>
			</div>
			<input class="easyui-textbox" id="tel" value="${user.tel}" data-options="label: '手机:'"><br> 
			<input class="easyui-textbox" id="qq" value="${user.qq}" data-options="label: 'QQ:'"><br> 
			<input class="easyui-textbox" id="birthday" value="<fmt:formatDate value="${user.birthday}" pattern="yyyy-MM-dd"/>" data-options="label: '生日:'"><br> 
			<input class="easyui-textbox" id="email" value="${user.email}" data-options="label: '邮箱:'"><br> 
			<input class="easyui-textbox" id="address" value="${user.address}" data-options="label: '住址:'"><br> 
			<input class="easyui-textbox" id="job" value="${user.job}" data-options="label: '职业:'"><br> 
			<input class="easyui-textbox" id="school" value="${user.school}" data-options="label: '学校:'"><br>
			<input class="easyui-textbox" id="company" value="${user.company}" data-options="label: '公司:'"><br> 
			<input id="country" value="${user.country}" class="easyui-combobox" data-options="    
        	valueField: 'name',    
        	textField: 'name',   
      		limitToList:true,
			showItemIcon :true,
			label: '国家:',
			prompt:'请选择国家',
			missingMessage:'请选择国家名称', 
        url: '${ctx}/getCountrys'
       " />   <br> 
			<input class="easyui-textbox" id="info" maxlength="200" value="${user.info}" data-options="label: '个人简介:',height:100,multiline:true"><br>
		</div>
		<div id="noEdit">
			<input class="easyui-textbox" id="createTime" value="<fmt:formatDate value="${user.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				data-options="label: '注册时间:'"><br> <input class="easyui-textbox" id="lastLoginTime"
				value="<fmt:formatDate value="${user.lastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" data-options="label: '上次登录时间:'"><br> <input
				class="easyui-textbox" id="lastUpdateTime" value="<fmt:formatDate value="${user.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
				data-options="label: '上次修改时间:'"><br>
		</div>
		<br>
		<div id="btn">
			<a class="easyui-linkbutton" data-options="iconCls:'icon-save'" onClick="saveInfo()">保存</a> <a class="easyui-linkbutton"
				data-options="iconCls:'icon-reload'" onClick="reset()">重置</a>
		</div>
		<div id="win" style="display: none; padding: 20px;">
			<P>原密码:
			<p>
				<input id="password" type="password">
			<P>新密码:
			<p>
				<input id="newPassword" type="password">
			<P>确认新密码:
			<p>
				<input id="newPassword2" type="password"> <br>
				<br>
			<div id="warn1"></div>
			<br>
			<br>
			<a id="save" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onClick="savePwd()">保存</a>
		</div>

		<!-- 	<div id="win2" style="display: none;">  -->
		<!-- 	          <div id="warn2" style="text-align: center;font-weight: bold;"></div><br><br><a id="save" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onClick="savePwd()">保存</a> -->
		<!-- 	</div> -->
	</div>
</body>
