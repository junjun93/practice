<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<%@ include file="/web/include/public.jsp"%>
<%@ include file="/web/include/header.jsp"%>
<title>管理员</title>
<script>
	// KindEditor.ready(function (K) {
	//     window.editor = K.create('#editor_id', {
	// //这里是指定的文件上传input的的属性名
	//         filePostName: "uploadFile",
	//         fileManagerJson : '${ctxStatic}/kindeditor/jsp/file_manager_json.jsp',
	// //这里就是指定文件上传的请求地址，上面也已经说了，upload_json.jsp就相当去一个servlet去进行保存文件，这个地方很重要
	//         uploadJson:  '${ctxStatic}/kindeditor/jsp/upload_json.jsp',
	//         resizeType: 1,
	//         allowPreviewEmoticons: true,
	//         allowImageUpload: true,
	//     });
	// })

	KindEditor.ready(function(K) {
		var editor1 = K.create('textarea[name="content1"]', {
			cssPath : '${ctxStatic}/kindeditor/plugins/code/prettify.css',
			uploadJson : '${ctxStatic}/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '${ctxStatic}/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
</script>
<style>
#form1 {
	padding: 80px;
}
</style>
<body>
<div id="form1">
	<%=htmlData%>
	<form name="example" method="post" action="demo.jsp">
		<textarea name="content1" cols="100" rows="8" style="width: 700px; height: 200px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
		<br /> <input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
	<!-- <form  method="post" action="http://localhost:8080/test/kindservlet">
<textarea id="editor_id" name="content" style="width:700px;height:300px;">
	&lt;strong&gt;HTML内容&lt;/strong&gt;
</textarea>
<button>提交内容</button>
</form> -->
</div>
</body>
<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>