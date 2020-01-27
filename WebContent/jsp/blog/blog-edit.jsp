<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>TRY1T</title>
    <base href=" <%=basePath%>">
    <link href="lib/layui/css/layui.css" rel="stylesheet" />
    <script src="lib/layui/layui.js"></script>
    <script src="lib/ace/ace.js"></script>
    <script src="js/jquery.min.js"></script>
    <script src="js/HandyEditor.min.js"></script>
</head>
<body>
<c:forEach items="${cs}" var="c" varStatus="st">
	<form style="margin-right: 50px" class="layui-form">
		<br>
		<input id="id" value="${c.id}" style="display:none">
		<div class="layui-form-item">
			<label class="layui-form-label">标题</label>
			<div class="layui-input-block">
				<input value="${c.title}" type="text" id="title" required placeholder="请输入标题"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">副标题</label>
			<div class="layui-input-block">
				<input value="${c.subtitle}" type="text" id="subtitle" required placeholder="请输入副标题"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">标签</label>
			<div class="layui-input-block">
				<input value="${c.category}" type="text" id="tag" required placeholder="请输入标签"
					autocomplete="off" class="layui-input max_width500">
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">内容</label>
			<div class="layui-input-block">
				 <textarea class="layui-textarea"  id="editor" name="editor" rows="4" style="display: none;"></textarea>
			</div>
		</div>
	</form>
	</c:forEach>
	<div style="margin: 20px; text-align: center" class="layui-form-item">
		<button id="button2" class="layui-btn">修改</button>
	</div>
    <script>
        layui.use(['layedit', 'layer', 'jquery'], function () {
            var $ = layui.jquery;
            var layedit = layui.layedit;
            var he = HE.getEditor('editor');
            he.set('${content}');

       
$(function() {
	
	           $("#button2").click(function() {			 
	        	   var rawdata = {"content" : he.getHtml()};
	        		var data = JSON.stringify(rawdata);
				$.ajax({
					type : "POST",
					contentType:"application/x-www-form-urlencoded; charset=utf-8",
					url : "/ssm/blog-edit?title=" + + encodeURI(encodeURI($("#title").val()))
					+"&subtitle=" + encodeURI(encodeURI($("#subtitle").val()))
					+"&tag=" + encodeURI(encodeURI($("#tag").val())) + "&id=" + encodeURI(encodeURI($("#id").val())),
                    data : data,
					dataType : "json",
					success : function(data) {
						var obj = JSON.parse(data);
						if (obj.result == "success") {
							layer.alert('修改成功！', {
							    yes:function(){
							    	var index = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
									window.parent.location.reload();
							    }
							});
						} else if (obj.result == "fail") {
							layer.alert("修改失败")
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