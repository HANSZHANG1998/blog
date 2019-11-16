<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TRY1T</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" tppabs="css/style2.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.min.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>
<script src="lib/layui/layui.js" charset="utf-8"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
});
</script>
</head>
<body>
<dl class="admin_login">
 <dt>
  <strong>TRY1T BLOG</strong>
  <em>前端登陆</em>
 </dt>
 <dd class="user_icon">
  <input type="text" placeholder="账号" id="username" class="login_txtbx"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" placeholder="密码" id="password" class="login_txtbx"/>
 </dd>
 <dd>
  <button id="loginbutton" class="submit_btn">登陆</button>
 </dd>
 <dd>
 <p style="margin-top:20px" class="message">
				还没有账户? <a href="register.jsp">立刻创建</a>
</p>
 </dd>
 <dd>
  <p>© TRY1T.COM</p>
 </dd>
</dl>
</body>
<script type="text/javascript">
		layui.use([ 'form', 'layer' ], function() {
			$ = layui.jquery;
			var layer = layui.layer;
		});

		$(function() {
			$("#loginbutton").click(function() {
				var rawdata = {
					"username" : $("#username").val(),
					"password" : $("#password").val()
				};
				var data = JSON.stringify(rawdata);

				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ssm/login",
					data : data,
					dataType : "json",
					success : function(data) {
						//layer.alert(data);
						var obj = JSON.parse(data);
						if (obj.result == "success") {	
							layer.alert('登录成功！欢迎回来', {
							    yes:function(){
							    	window.location.href = "/ssm/frontend";
							    }
							});
						} else if (obj.result == "fail") {
							layer.alert("密码错误")
						}
					},
					error : function(e) {
						layer.alert("登录失败-debug");
						window.location.href = "/ssm";

					}
				});
			});
		});
	</script>
</html>

