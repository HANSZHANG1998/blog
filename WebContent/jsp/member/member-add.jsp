<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	HttpSession a = request.getSession();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>欢迎页面</title>
<base href=" <%=basePath%>">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" href="css/font.css">
<link rel="stylesheet" href="css/xadmin.css">
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="js/xadmin.js"></script>
<!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
<!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="x-body layui-anim layui-anim-up">
		<form class="layui-form">

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>登录名</label>
				<div class="layui-input-inline">
					<input type="text" id="username" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>性别</label>
				<div class="layui-input-inline">
					<input type="text" id="sex" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>手机</label>
				<div class="layui-input-inline">
					<input type="text" id="phone" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>邮箱</label>
				<div class="layui-input-inline">
					<input type="text" id="email" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>地址</label>
				<div class="layui-input-inline">
					<input type="text" id="address" autocomplete="off" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label"><span class="x-red">*</span>状态</label>
				<div class="layui-input-inline">
					<input type="text" id="state" autocomplete="off" class="layui-input">
				</div>
			</div>


			<div class="layui-form-item">
				<label class="layui-form-label"> <span class="x-red">*</span>密码</label>
				<div class="layui-input-inline">
					<input type="password" id="password" autocomplete="off" class="layui-input">
				</div>
				<div class="layui-form-mid layui-word-aux">6到16个字符</div>
			</div>

		</form>
			<div class="layui-form-item">
			    <label class="layui-form-label"> </label> 
				<button id="button" class="layui-btn">添加</button>
			</div>
	</div>

	<script>
	layui.use([ 'form', 'layer' ], function() {
		$ = layui.jquery;
		var layer = layui.layer;
	});
        
    /*	$(function() {
			$(document).keydown(function(event) {
				if (event.keyCode == 13) {
					$("#button").click();
				}
			});
		})
*/
	$(function() {
			$("#button").click(function() {
				var rawdata = {
						"username" : $("#username").val(),
						"sex" : $("#sex").val(),
						"phone" : $("#phone").val(),
						"email" : $("#email").val(),
						"address" : $("#address").val(),
						"state" : $("#state").val(),
						"password" : $("#password").val()
				};
				var data = JSON.stringify(rawdata);
				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ssm/member-add",
					data : data,
					dataType : "json",
					success : function(data) {
						var obj = JSON.parse(data);
						if (obj.result == "success") {
							layer.alert('添加成功！', {
							    yes:function(){
							    	var index = parent.layer.getFrameIndex(window.name);
									parent.layer.close(index);
									window.parent.location.reload();
							    }
							});
						} else if (obj.result == "fail") {
							layer.alert("添加失败");
						} else if(obj.result == "fail1") {
							layer.alert("已存在该用户名")
						} 
					},
					error : function(e) {
						layer.alert("添加失败-debug");
					}
				});
			});
		});
	</script>
	
</body>

</html>