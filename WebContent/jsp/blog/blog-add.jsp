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
			<label class="layui-form-label">分类</label>
			<div class="layui-input-block">
				<select id="category" name="city">
					<option value="" class="max_width500"></option>
					<option value="0" class="max_width500">分享</option>
					<option value="1" class="max_width500">新闻</option>
					<option value="2" class="max_width500">笔记</option>
					<option value="3" class="max_width500">展示</option>
					<option value="4" class="max_width500">大事件</option>
				</select>
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标签选择</label>
			<div class="layui-input-block">
				<input type="checkbox" id="id1" title="技术分享"> <input
					type="checkbox" id="id2" title="心情随笔"> <input
					type="checkbox" id="id3" title="问题解答">
			</div>
		</div>
		<div style="display:none" class="layui-form-item">
			<label class="layui-form-label">置顶</label>
			<div class="layui-input-block">
				<input id="top" type="checkbox" lay-skin="switch">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">内容</label>
			<div class="layui-input-block">
				<textarea placeholder="请输入内容" class="layui-textarea" id="editor"></textarea>
			</div>
		</div>
	</form>
	<div style="margin: 20px; text-align: center" class="layui-form-item">
		<button id="button2" class="layui-btn">发布</button>
	</div>
	<script>
		layui
				.use(
						[ 'layedit', 'layer', 'jquery' ],
						function() {
							var $ = layui.jquery;
							var layedit = layui.layedit;
							var upload = layui.upload;
							layedit.set({
								//暴露layupload参数设置接口 --详细查看layupload参数说明
								uploadImage : {
									url : '/Attachment/LayUploadFile',
									accept : 'image',
									acceptMime : 'image/*',
									exts : 'jpg|png|gif|bmp|jpeg',
									size : '10240'
								},
								uploadVideo : {
									url : '/Attachment/LayUploadFile',
									accept : 'video',
									acceptMime : 'video/*',
									exts : 'mp4|flv|avi|rm|rmvb',
									size : '20480'
								}
								//右键删除图片/视频时的回调参数，post到后台删除服务器文件等操作，
								//传递参数：
								//图片： imgpath --图片路径
								//视频： filepath --视频路径 imgpath --封面路径
								,
								calldel : {
									url : '/Attachment/DeleteFile'
								}
								//开发者模式 --默认为false
								,
								devmode : true
								//插入代码设置
								,
								codeConfig : {
									hide : false
								//是否显示编码语言选择框
								//default: 'javascript' hide为true时的默认语言格式
								},
								tool : [ 'html', 'code', 'strong', 'italic',
										'underline', 'del', 'addhr', '|',
										'fontFomatt', 'colorpicker', 'face',
										'|', 'left', 'center', 'right', '|',
										'link', 'unlink', 'image_alt', 'video',
										'anchors', '|', 'fullScreen' ]
							});
							var ieditor = layedit.build('editor');

							$(function() {
								$("#button2").click(function() {
									var check = "";
									 if($("#top").val() == "on") {
					                     check = "checked='checked'";
					                 } else {
					                	 check = "";
					                 }
													$.ajax({
																type : "POST",
																contentType : "application/json",
																url : "/ssm/blog-add?content="
																		+ encodeURI(encodeURI(layedit.getContent(ieditor)))
																		+"&title=" + encodeURI(encodeURI($("#title").val()))
																		+"&subtitle=" + encodeURI(encodeURI($("#subtitle").val()))
																		+"&category=" + encodeURI(encodeURI($("#category").val()))
																		+"&id1=" + encodeURI(encodeURI($("#id1").val()))
																		+"&id2=" + encodeURI(encodeURI($("#id2").val()))
																		+"&id3=" + encodeURI(encodeURI($("#id3").val()))
																		+"&top=" + encodeURI(encodeURI(check)),
																		
																data : "",
																dataType : "json",
																success : function(
																		data) {
																	//layer.alert(data);
																	var obj = JSON
																			.parse(data);
																	if (obj.result == "success") {
																		layer
																				.alert(
																						'发布成功！',
																						{
																							yes : function() {
																								var index = parent.layer
																										.getFrameIndex(window.name);
																								parent.layer
																										.close(index);
																								window.parent.location
																										.reload();
																							}
																						});
																	} else if (obj.result == "fail") {
																		layer
																				.alert("发布失败")
																	}
																},
																error : function(
																		e) {
																	layer
																			.alert("发布失败-debug");
																}
															});
												});
							});
						})
	</script>

</body>
</html>