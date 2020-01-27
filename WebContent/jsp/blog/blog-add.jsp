<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TRY1T</title>
<base href=" <%=basePath%>">
<link href="lib/layui/css/layui.css" rel="stylesheet" />
<script src="lib/layui/layui.js"></script>
<script src="lib/ace/ace.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/HandyEditor.min.js"></script>
</head>
<body>
	<form style="margin-right: 50px" class="layui-form">
		<br>
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input type="text" id="title" required placeholder="请输入标题"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">副标题</label>
			<div class="layui-input-block">
				<input type="text" id="subtitle" required placeholder="请输入副标题"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标签</label>
			<div class="layui-input-block">
				<input type="text" id="tag" required placeholder="请输入标签"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">内容</label>
			<div class="layui-input-block">			
             <textarea class="layui-textarea"  id="editor" name="editor" rows="5" style="display: none;"></textarea>
			</div>
		</div>
	</form>
	<div style="margin: 20px; text-align: center" class="layui-form-item">
		<button id="button2" class="layui-btn">发布</button>
	</div>
	<script>
		layui.use([ 'layedit', 'layer', 'jquery' ],
						function() {
							var $ = layui.jquery;
							var layedit = layui.layedit;
							var he = HE.getEditor('editor');
							$(function() {
								$("#button2").click(function() {
									 var rawdata = {"content" : he.getHtml()};
						        	 var data = JSON.stringify(rawdata);
										$.ajax({
											type : "POST",
											contentType:"application/x-www-form-urlencoded; charset=utf-8",
											url : "/ssm/blog-add?title=" + encodeURI(encodeURI($("#title").val()))
											+"&subtitle=" + encodeURI(encodeURI($("#subtitle").val()))
											+"&tag=" + encodeURI(encodeURI($("#tag").val())),
						                    data : data,
											dataType : "json",
											success : function(data) {
												var obj = JSON.parse(data);
												if (obj.result == "success") {
													layer.alert('发布成功！', {
													    yes:function(){
													    	var index = parent.layer.getFrameIndex(window.name);
															parent.layer.close(index);
															window.parent.location.reload();
													    }
													});
												} else if (obj.result == "fail") {
													layer.alert("发布失败")
												}
											},
											error : function(e) {
											layer.alert("发布失败-debug");
											}
										});
							});
							});
						})
	</script>

</body>
</html>