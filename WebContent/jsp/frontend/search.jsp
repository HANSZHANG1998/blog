<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";

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
	<link rel="icon" href="images/icon.jpg">
</head>
<div style="height:80px;"></div>
<body>
	<header style="background-color: #254b50;">
		<nav class="layui-container">
<ul style="background-color: transparent" class="layui-nav">
 			    	    <li style="margin-left:-20px" class="layui-nav-item layui-this">
					    <a href="frontend">TRY1T BLOG</a>
					  	</li>		  
<li style="float: right; margin-right: -20px" class="layui-nav-item">
					<a href="${href}"><img src="${url}" class="layui-nav-img">${username}</a>
					${fill}
				</li>
</ul>
		</nav>
	</header>
	<div class="layui-container">
		<div class="layui-row layui-col-space20">
			<div class="layui-col-md8">
				<div class="layui-row">
                    <div class="layui-col-md12">
						<div style="border-radius: 10px;" class="layui-card">
						  	<div class="layui-card-header">
								<span>
									搜索
								</span>
						  	</div>
						  	<div class="layui-card-body" style="text-align: center;">
               <input style="width:80%;display:inline" type="text" id="search" name="search" value="${search}" placeholder="请输入查询内容" autocomplete="off" class="layui-input">&nbsp<button style="display:inline;margin-top:-4px" class="layui-btn" id="searchBtn" >搜索</button>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<c:forEach items="${cs}" var="c" varStatus="st"> 
					<div class="layui-col-md12">
						<div style="border-radius: 10px;" class="main list">
							<div class="subject"><a href="detail?id=${c.id}">${c.title}</a><em>&nbsp&nbsp${c.date}发布</em></div>
							<div class="content layui-row">
								
									<div class="list-text">${c.content}</div>
									<div class="list-stat layui-row">

										<div class="layui-col-xs3 layui-col-md3 Label">
											<i class="layui-icon layui-icon-note"></i>
										</div>

										<div class="layui-col-xs3 layui-col-md3">
											<i class="layui-icon layui-icon-reply-fill"></i>
											<em>0条评论</em>
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
			<div class="page">
			<div style="display:inline">
				<a class="prev" href="search?pagenum=1">&lt;&lt;</a>&nbsp&nbsp
				<div style="display:inline;${display1}"><a class="num" href="search?pagenum=${prev}">${prev}</a>&nbsp&nbsp</div>
				<span class="current" style="background-color: #009688">${pagenum}</span>&nbsp&nbsp
				<div style="display:inline;${display2}"><a class="num" href="search?pagenum=${next}">${next}</a>&nbsp&nbsp</div>
				<a class="next" href="search?pagenum=${last}">&gt;&gt;</a>
			</div>
		</div>
		<div class="layui-col-md12 margin20"></div>
				</div>
	        </div>
			<div class="layui-col-md4">
			    <div class="layui-row">
					<div class="layui-col-md12">
						<div style="border-radius: 6px;" class="layui-card">
							<div class="layui-card-header">
								<span> 标签 </span>
							</div>
							<div class="layui-card-body">
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">1按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">2按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">3按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">迷你按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">4按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">5按钮</button>
								<button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">迷你按钮</button>
						        <button style="margin:5px" type="button" class="layui-btn layui-btn-xs ">6按钮</button>
							</div>
							<div class="margin10"></div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div style="border-radius: 6px;" class="layui-card">
							<div class="layui-card-header">
								<span class="layui-breadcrumb" lay-separator="|"> <a
									href="javascript:;">站点详情</a>
								</span>
							</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<div class="footer"></div>
	<div style="height:80px;"></div>
	<footer style="background-color:#254b50">
		<div class="layui-container">
			<div class="layui-row">
				<P>try1t.com All rights reserved</P>
			</div>
		</div>
	</footer>
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
  	
  	$( "#searchBtn" ).click(function() {
  		window.location.href = "search?content=" + $("#search").val();
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
							window.location.href = "/ssm/frontend";
						}
					});
			    }
			});
  	  
  	});
});
  	
</script>
</html>