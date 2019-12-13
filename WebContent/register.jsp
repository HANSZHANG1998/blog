<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>TRY1T</title>
<link rel="stylesheet" type="text/css" href="css/style2.css" tppabs="css/style2.css" />
<link rel="icon" href="images/icon.jpg">
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
 <dd>
  <input type="text" placeholder="账号" id="username" class="login_txtbx"/>
 </dd>
 <dd>
  <input type="password" placeholder="密码" id="password" class="login_txtbx"/>
 </dd>
 <dd>
 <input type="text" placeholder="email" id="email" class="login_txtbx"/>
 </dd>
 <dd>
  <button id="create" class="submit_btn">注册</button>
 </dd>
 <dd>
 <p style="margin-top:20px" class="message">
				已经有了一个账户? <a href="login.jsp">立刻登录</a>
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

		/*	$(function() {
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				$("#loginbutton").click();
			}
		});
	})
*/
		$(function() {
			$("#create").click(function() {
				var rawdata = {
					"username" : $("#username").val(),
					"password" : $("#password").val(),
					"email" : $("#email").val()
				};
				var data = JSON.stringify(rawdata);

				$.ajax({
					type : "POST",
					contentType : "application/json",
					url : "/ssm/register",
					data : data,
					dataType : "json",
					success : function(data) {
						//layer.alert(data);
						var obj = JSON.parse(data);
						if (obj.result == "success") {
							layer.alert('注册成功！请登录', {
							    yes:function(){
							    	window.location.href = "/ssm/login.jsp";
							    }
							});
                            
							
						} else if (obj.result == "fail1") {
							layer.alert("已注册该用户，请登陆或重新注册");
						} else if (obj.result == "nullusername") {
							layer.alert("用户名不能为空");
						} else if (obj.result == "nullpassword") {
							layer.alert("密码不能为空");
						} else if (obj.result == "nullemail") {
							layer.alert("邮箱不能为空");
						} else {
							layer.alert("注册失败");
						}
					},
					error : function(e) {
						alert("注册失败-debug");

					}
				});
			});
		});
	</script>
</html>

