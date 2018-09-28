<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<%@ include file="../include/public.jsp"%>
<title>SQL生成工具</title>
</head>
<script type="text/javascript">
	$(function() {

	});

	//上传文件功能
	function upload() {
		var fileName = $("#file").filebox('getValue');
		if (fileName == "") {
			$.messager.alert('提示', '请上传文件');
			return;
		} else {
			$('#upload').linkbutton('disable');
			$("#upload_form").submit();
			$.messager.alert('提示', '上传完成');
			$('#upload').linkbutton('enable');
			$("#uploadfile").form("clear");
			//			window.location.href="${ctx}";
		}
	}

	function parse() {
		var fileName = $("#excel").filebox('getValue');
		$('#exceltoSQL').form('submit', {
			url : '${ctx}/tool/parseExcel',
			onSubmit : function() {
				if (fileName == "") {
					bigAlert('提示', '请上传Excel文件', 'warning');
					return false;
				}
			},
			success : function(data) {
				$('#parserExcel').divBtnDisabled();
				$.messager.progress();
				var data = eval('(' + data + ')');
				if (data.status == "error") {
					$.messager.progress('close');
					bigAlert('错误', "请重新上传!<br>" + data.info, 'error');
					$('#parserExcel').divBtnEnabled();
					return;
				} else if (data.status == "ok") {
					$.messager.progress('close');
					bigAlert('提示', "转换完毕！！！");
					$('#parserExcel').divBtnEnabled();
					$("#downloadSQL").show();
				} else {
					$.messager.progress('close');
					bigAlert('错误', '系统繁忙', 'warning');
					$('#parserExcel').divBtnEnabled();
					return;
				}
			}
		});
	}

	//下载SQL文件
	function downloadSQL() {
		var filePathName = $('#excel').filebox('getValue');
		var arr = filePathName.split('\\'); //通过特殊字符分割字符串成数组
		var my = arr[arr.length - 1];
		var sqlFileName = my.replace(".xlsx", ".sql").replace(".xls", ".sql");
		window.location.href = "${ctx}/tool/download?filename="
				+ sqlFileName;
		// 			$("#downloadSQL").hide();
	}
</script>
<style>
#toolIndex {
	padding: 3% 0 3% 3%;
	left: 5%;
	top: 10%;
	border-radius: 33px;
	background-color: rgba(255, 255, 255, 0.6);
}

#toolIndex>div {
	display: inline-block;
	margin: 1%;
}

.divBtn {
	width: 15%;
}
</style>

<body>
	<%@ include file="../include/header.jsp"%>
	<div id="toolIndex">
		<!-- 		<div> -->
		<%-- 			<form id="upload_form" method="post" enctype="multipart/form-data" action="${ctx}/tool/uploadFile"> --%>
		<!-- 				<div style="margin-top: 7px;"> -->
		<!-- 					<input id="file" class="easyui-filebox" name="file" style="width: 300px" data-options="buttonText:'上传文件',prompt:'请选择文件'"> -->
		<!-- 				</div> -->
		<!-- 								<input type="submit" value="提交" > -->
		<!-- 			</form> -->
		<%-- 			<a id="upload" onclick="upload()" href="#" class="easyui-linkbutton">上传</a> <a id="download" href="${ctx}/tool/download?filename=123.txt" --%>
		<!-- 				href="#" class="easyui-linkbutton">下载</a> -->
		<!-- 		</div> -->
		<br>
		<div style="position: relative; top: -200px;">
			<h2>Excel转SQL文件</h2>
			<p>说明：</p>
			<p>1,请按照模板要求，将对应信息填充进Excel</p>
			<p>2,除了字段长度列和主键列，其他列不能为空</p>
			<p>3,只能上传xls、xlsx类型文件</p>
			<p>4,转换成功后,点击下载SQL文件按钮即可</p>
		</div>
		<div>
			<h1>示例</h1>
			<img alt="示例" src="${ctxStatic}/img/tool/ExceltoSQLcase.png">

			<form style="padding: 3% 0" id="exceltoSQL" method="post" enctype="multipart/form-data">
				<input id="excel" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel" class="easyui-filebox"
					type="excel" name="file" style="width: 300px" data-options="buttonText:'上传Excel文件',prompt:'请选择文件',
				"> <select id="dbType"
					class="easyui-combobox" name="dbType" style="width: 200px;" data-options="labelPosition: 'left',labelWidth:100,label: '数据库类型:'">
					<option value="MySQL">MySQL</option>
					<option value="Oracle">Oracle</option>
				</select>
			</form>
			<br />
			<div id="downloadTemplate" onclick="window.location.href='${ctx}/tool/downloadTemp'" class="divBtn " onClick="test() ">导入模板下载</div>
			<div id="parserExcel" class="divBtn" onClick="parse() ">生成SQL文件</div>
			<div id="downloadSQL" style="display: none;" class="divBtn " onClick="downloadSQL() ">下载SQL文件</div>
		</div>
	</div>

</body>

</html>