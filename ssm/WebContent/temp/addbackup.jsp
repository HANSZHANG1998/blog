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
 	<form class="layui-form">
 	<h2 style="margin: 20px;text-align:center">添加文章</h2>
 				
 				<div class="layui-form-item">
				<label class="layui-form-label">标题</label>
				<div style="width: 80%" class="layui-input-inline">
					<input type="text" id="title" autocomplete="off" class="layui-input">
				</div>
			</div>
				
				<div class="layui-form-item">
				<label class="layui-form-label">副标题</label>
				<div style="width:80%;" class="layui-input-inline">
					<input type="text" id="subtitle" autocomplete="off" class="layui-input">
				</div>
			</div>
			
    <p style="margin: 50px;">
        <textarea id="layeditDemo"></textarea>
</p>
</form>
<div style="margin: 20px;text-align:center" class="layui-form-item">
				<button id="button2" class="layui-btn">发布</button>
</div>
    <script>
        layui.use(['layedit', 'layer', 'jquery'], function () {
            var $ = layui.jquery;
            var layedit = layui.layedit;
            layedit.set({
                //暴露layupload参数设置接口 --详细查看layupload参数说明
                uploadImage: {
                    url: '/Attachment/LayUploadFile',
                    accept: 'image',
                    acceptMime: 'image/*',
                    exts: 'jpg|png|gif|bmp|jpeg',
                    size: '10240'
                }
                , uploadVideo: {
                    url: '/Attachment/LayUploadFile',
                    accept: 'video',
                    acceptMime: 'video/*',
                    exts: 'mp4|flv|avi|rm|rmvb',
                    size: '20480'
                }
                //右键删除图片/视频时的回调参数，post到后台删除服务器文件等操作，
                //传递参数：
                //图片： imgpath --图片路径
                //视频： filepath --视频路径 imgpath --封面路径
                , calldel: {
                    url: '/Attachment/DeleteFile'
                }
                //开发者模式 --默认为false
                , devmode: true
                //插入代码设置
                , codeConfig: {
                    hide: false  //是否显示编码语言选择框
                    //default: 'javascript' hide为true时的默认语言格式
                }
                , tool: [
                    'html', 'code', 'strong', 'italic', 'underline', 'del', 'addhr', '|', 'fontFomatt', 'colorpicker', 'face'
                    , '|', 'left', 'center', 'right', '|', 'link', 'unlink', 'image_alt', 'video', 'anchors'
                    , '|', 'fullScreen'
                ]
            });
            var ieditor = layedit.build('layeditDemo');

        
       
$(function() {
			$("#button2").click(function() {
				
				var rawdata = {
					"title" : $("#title").val(),
					"subtitle" : $("#subtitle").val(),
				};
				var data = JSON.stringify(rawdata);
              
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ssm/blog-add?title=" + encodeURI(encodeURI($("#title").val())) + "&subtitle=" + encodeURI(encodeURI($("#subtitle").val())) + "&content=" + encodeURI(encodeURI(layedit.getContent(ieditor))),
					data : "",
					dataType : "json",
					success : function(data) {
						//layer.alert(data);
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