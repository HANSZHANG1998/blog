<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
String username = (String)session.getAttribute("username");
String url = (String)session.getAttribute("url");
if(url == null){
	url = "images/default.jpg";
}else{
	url = "images/avatar/" + url;
}
String fill = "";
String href = "";
String display = "";
String display1 = "";
String display2 = "";
String category = "";
if(username == null){
	username = "请登录";
	href = "/ssm";
	display="display:none";
	}
else{
	href="javascript:;";
	fill = "<dl class='layui-nav-child'><dd><a href='account'>个人中心</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
}
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  	<meta name="apple-mobile-web-app-status-bar-style" content="black"> 
  	<meta name="apple-mobile-web-app-capable" content="yes">
  	<meta name="format-detection" content="telephone=no">
    <title>TRY1T</title>
	<base href=" <%=basePath%>">
	<link rel="stylesheet" href="lib/layui/css/layui.css">
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/detail.css">
</head>
<body>
<header class="layui-bg-cyan">
		<nav class="layui-container">
		<ul class="layui-nav layui-bg-cyan">
 			    	    <li style="margin-left:-20px" class="layui-nav-item">
					    	<a href="frontend">BLOG</a>
					  	</li>
					  	<li class="layui-nav-item"><a href="javascript:;">分类</a>
					  	<dl class="layui-nav-child">
					  	<dd><a href="cate?category=0">分享</a></dd>
					  	<dd><a href="cate?category=1">新闻</a></dd>
					  	<dd><a href="cate?category=2">笔记</a></dd>
					  	<dd><a href="cate?category=3">展示</a></dd>
					  	<dd><a href="cate?category=4">大事件</a></dd>
					  	</dl>
					  	</li>
  <li style="float:right;margin-right:-20px" class="layui-nav-item">
     <a href="<%=href%>"><img src="<%=url%>" class="layui-nav-img"><%=username%></a>
<%=fill%>
  </li>
     </ul>
		</nav>
	</header>
<div class="layui-container">
		<div class="layui-row layui-col-space20">
			        <div class="layui-col-md3">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div style="border-radius: 25px; text-align:center" class="layui-card">
						  	<div class="layui-card-header">
								<span class="layui-breadcrumb" lay-separator="|">
									<a href="javascript:;">个人中心</a>
								</span>
						  	</div>
						  	<div class="layui-card-body" id="stat">
						  		<div style="" class="layui-breadcrumb">
									<a href="/ssm/account">个人资料</a>
								</div>
								<div class="layui-breadcrumb">
									<a href="/ssm/resetpassword"><b style="color:black">密码修改</b></a>
								</div>
						  		<div class="layui-breadcrumb">
									<a href="javascript:;">文章管理</a>
								</div>
								<p></p>
								<div class="layui-breadcrumb">
									<a href="javascript:;">评论管理</a>
								</div>
								<p></p>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					
				</div>
	        </div>

			<div class="layui-col-md9">
			<div style="border-radius: 25px;" class="layui-col-md12 layui-card">
                     <div class="layui-row">
				    <div class="margin20"></div>
					<form class="layui-form">
			<input style="display:none" id="username" value="<%=username%>">
			<div class="layui-form-item">
				<label class="layui-form-label">老新密码</label>
				<div class="layui-input-inline">
					<input type="password" id="password" class="layui-input">
				</div>
			</div>
			
			<div class="layui-form-item">
				<label class="layui-form-label">新密码</label>
				<div class="layui-input-inline">
					<input type="password" id="newpassword" class="layui-input">
				</div>
			</div>

			<div class="layui-form-item">
				<label class="layui-form-label">重复密码</label>
				<div class="layui-input-inline">
					<input type="password" id="repass" class="layui-input">
				</div>
			</div>

		</form>
		<div class="layui-form-item"><label class="layui-form-label"></label>
		<button id="edit" class="layui-btn">修改</button>
	    </div>
		<div class="margin10"></div>
					</div>
			</div>
	        </div>
		</div>
	</div>
</body>
<script src="lib/layui/layui.all.js"></script>
<script> 
layui.use([ 'form', 'layer' ], function() {
	$ = layui.jquery;
	var layer = layui.layer;
	layui.carousel.render({
	    elem: '#carousel'
	    ,width: '100%' //设置容器宽度
	    ,arrow: 'always' //始终显示箭头
	    //,anim: 'updown' //切换动画方式
  	});
  	layui.laypage.render({
	    elem: 'pages' //注意，这里的 test1 是 ID，不用加 # 号
	    ,count: 123 //数据总数，从服务端得到
  	});
  	
  	$( "#logout" ).click(function() {
  	  layer.confirm("确定退出吗", {
			    yes:function(){
					$.ajax({
						type : "POST",
						contentType : "application/json",
						url : "/ssm/logout",
						data : "",
						dataType : "json",
						success : function(data) {
							var obj = JSON.parse(data);
							if (obj.result == "success") {	
								window.location.reload();
							} else if (obj.result == "fail") {
								layer.alert("error-debug1")
							}
						},
						error : function(e) {
							layer.alert("error-debug2");
							window.location.reload();
						}
					});
			    }
			});
  	  
  	});
  	
  	$( "#edit" ).click(function() {
                   if($("#newpassword").val() != $("#repass").val()){
                	   layer.alert('第二次输入的密码不正确！');
                   }else{
  					$.ajax({
  						type : "POST",
  						contentType:"application/x-www-form-urlencoded; charset=utf-8",
  						url : "/ssm/frontend-password-edit?username=" + encodeURI(encodeURI($("#username").val())) + 
  								"&password=" + encodeURI(encodeURI($("#password").val())) +
                                "&newpassword=" + encodeURI(encodeURI($("#newpassword").val())),
  						data : "",
  						dataType : "json",
  						success : function(data) {
  							var obj = JSON.parse(data);
  							if (obj.result == "success") {	
  								layer.alert('修改成功！', {
								    yes:function(){
										window.location.reload();
								    }
								});
  							} else if (obj.result == "fail") {
  								layer.alert("error-debug1");
  							}
  							else if (obj.result == "fail1") {
  								layer.alert("密码错误");
  							}
  						},
  						error : function(e) {
  							layer.alert("error-debug2");
  						}
  					});
                   }
    	  
    	});
});</script>

</html>