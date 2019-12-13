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
String curr = request.getAttribute("current").toString();
int current = Integer.parseInt(curr);
int pages = (int)request.getAttribute("pages");
String fill = "";
String href = "";
String display = "";
String display1 = "";
String display2 = "";
if(username == null){
	username = "请登录";
	href = "/ssm/login.jsp";
	display="display:none";
	}
else{
	href="javascript:;";
	fill = "<dl class='layui-nav-child'><dd><a href='account'>个人中心</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
}
if(current == 1){
	display1 = "display:none";
}
if(current == pages){
	display2 = "display:none";
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
	<link rel="stylesheet" href="css/xadmin.css">
	<link rel="icon" href="images/icon.jpg">
</head>
<body>
<header style="background-color: #254b50;">
		<nav class="layui-container">
		<ul style="background-color: transparent" class="layui-nav">
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
     <a href="<%=href%>"><img src="<%=url%>" class="layui-nav-img"><%=username%></a><%=fill%>
  </li>
     </ul>
		</nav>
	</header>
<div class="layui-container">
		<div class="layui-row layui-col-space20">
			        <div class="layui-col-md3">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div style="border-radius: 10px; text-align:center" class="layui-card">
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
									<a href="/ssm/resetpassword">密码修改</a>
								</div>
						  		<div class="layui-breadcrumb">
									<a href="/ssm/article"><b style="color:black">文章管理</b></a>
								</div>
								<p></p>
								<div class="layui-breadcrumb">
									<a href="javascript:;">评论管理</a>
								</div>
								<p></p>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin10"></div>
					
				</div>
	        </div>
		  
			
			<div class="layui-col-md9">

		<c:forEach items="${cs}" var="c" varStatus="st"> 
					<div class="layui-col-md12">
						<div style="border-radius: 10px;" class="main list">
						
							<div class="subject"><a href="detail?id=${c.id}">${c.title}</a><em>&nbsp&nbsp${c.date}发布</em></div>
							<div class="content layui-row">
								
									<div style="height:40px" class="list-text">${c.content}</div>
									<div class="list-stat layui-row">

										<div class="layui-col-xs3 layui-col-md3 Label">
											<i class="layui-icon layui-icon-note"></i>
											<a href="javascript:;"></a>
											<a href="javascript:;"></a>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											<i class="layui-icon layui-icon-reply-fill"></i>
											<em>${c.counts}条评论</em>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											<i class="layui-icon layui-icon-read"></i>
											<em>${c.views}次阅读</em>
										</div>

										<div class="layui-col-xs3 layui-col-md3 alink">
											<a href="detail?id=${c.id}" class="layui-btn layui-btn-xs">阅读原文</a>
										</div>
									</div>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					
</c:forEach>

<div class="layui-col-md12 page">
			
				<a class="prev" href="/ssm/article?current=1">&lt;&lt;</a> &nbsp&nbsp
				<a style="<%=display1%>" class="num" href="/ssm/article?current=<%=current-1%>"><%=current-1%></a> &nbsp &nbsp
			    <span class="current" style="background-color:#009688"><%=current%></span> &nbsp&nbsp
			    <a style="<%=display2%>" class="num" href="/ssm/article?current=<%=current+1%>"><%=current+1%></a> &nbsp&nbsp
				<a class="next" href="/ssm/article?current=<%=pages%>">&gt;&gt;</a>
		</div>
                <div class="layui-col-md12 margin20"></div>
                 <div class="layui-col-md12 margin20"></div>
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
							window.location.href = "/ssm/account";
						}
					});
			    }
			});
  	  
  	});
  	
  	$( "#edit" ).click(function() {
                    
  					$.ajax({
  						type : "POST",
  						contentType:"application/x-www-form-urlencoded; charset=utf-8",
  						url : "/ssm/frontend-user-edit?username=" + encodeURI(encodeURI($("#username").val())) + 
  								"&sex=" + encodeURI(encodeURI($("#sex").val())) +
  								"&phone=" + encodeURI(encodeURI($("#phone").val())) +
  								"&email=" + encodeURI(encodeURI($("#email").val())) +
                                "&address=" + encodeURI(encodeURI($("#address").val())),
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
  								layer.alert("error-debug1")
  							}
  						},
  						error : function(e) {
  							layer.alert("error-debug2");
  							window.location.href = "/ssm/account";
  						}
  					});
    	  
    	});
});</script>
</html>