<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String username = (String)session.getAttribute("username");
	String fill = "";
	String href = "";
	if(username == null){
		username = "请登录";
		href = "/ssm";
		}
	else{
		href="javascript:;";
		fill = "<dl class='layui-nav-child'><dd><a href='javascript:;'>账号信息</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
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
	<script src="js/jquery.session.js"></script> 
</head>
<body>
	<header class="layui-bg-cyan">
		<nav class="layui-container">
			<ul class="layui-nav layui-bg-cyan">
 			    	    <li style="margin-left:-20px" class="layui-nav-item layui-this">
					    	<a href="frontend">TRY1T BLOG</a>
					  	</li>
					  	<li class="layui-nav-item">
					    	<a href="">个人主页</a>
					  	</li>
  <li style="float:right;margin-right:-20px" class="layui-nav-item">
    <a href="<%=href%>"><img src="images/default.jpg" class="layui-nav-img"><%=username%></a>
<%=fill%>
  </li>
</ul>
		</nav>
	</header>
	<div class="layui-container">
		<div class="layui-row layui-col-space20">
			<div class="layui-col-md8">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-carousel" id="carousel">
					  		<div carousel-item>
							    <div><img src="images/1.jpg" alt=""></div>
							    <div><img src="images/2.jpg" alt=""></div>
					  		</div>
						</div>
					</div>
					
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="main zdbox">
							<div class="subject"><b>[置顶]</b><a href="">${c.title}</a><em>${c.date}发布</em></div>
							<div class="content">
							${c.content}
							</div>
						</div>
					</div>
					
					<c:forEach items="${cs}" var="c" varStatus="st"> 
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="main list">
						
							<div class="subject"><a href="detail?id=${c.id}">${c.title}</a><em>&nbsp&nbsp${c.date}发布</em></div>
							<div class="content layui-row">
								
									<div class="list-text">${c.content}</div>
									<div class="list-stat layui-row">

										<div class="layui-col-xs3 layui-col-md3 Label">
											<i class="layui-icon layui-icon-note"></i>
											<a href="javascript:;">PHP</a>
											<a href="javascript:;">Discuz</a>
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
</c:forEach>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12" id="pages"></div>
				</div>
	        </div>
	        <div class="layui-col-md4">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div class="layui-card">
						  	<div class="layui-card-header">
								<span class="layui-breadcrumb" lay-separator="|">
									<a href="javascript:;">站点统计</a>
									<a href="javascript:;">联系站长</a>
								</span>
						  	</div>
						  	<div class="layui-card-body" id="stat" style="display: none;">
						  		<table class="layui-table">
								  	<colgroup>
								    	<col width="120">
								    	<col width="230">
								  	</colgroup>
								  	<tbody>
								    	<tr>
								      		<td>运行时间：</td>
								      		<td>0 天</td>
								    	</tr>
								    	<tr>
								      		<td>发表文章：</td>
								      		<td>0 篇</td>
								    	</tr>
								    	<tr>
								      		<td>注册用户：</td>
								      		<td>0 人</td>
								    	</tr>
								  	</tbody>
								</table>
						  	</div>
						  	<div class="layui-card-body" id="binfo">
						  		<table class="layui-table">
								  	<colgroup>
								    	<col width="120">
								    	<col width="230">
								  	</colgroup>
								  	<tbody>
								    	<tr>
								      		<td>QQ：</td>
								      		<td>1185013588</td>
								    	</tr>
								    	<tr>
								      		<td>Wechat：</td>
								      		<td></td>
								    	</tr>
								    	<tr>
								      		<td>qqGroup：</td>
								      		<td></td>
								    	</tr>
								  	</tbody>
								</table>
						  	</div>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="layui-card">
						  	<div class="layui-card-header">
								<span>
									捐助本站
								</span>
						  	</div>
						  	<div class="layui-card-body" style="text-align: center;">
						    	<br/>
						    	<p>无论多少，都是心意!</p>
						  	</div>
						</div>
					</div>
				</div>
	        </div>
		</div>
	</div>
	<!-- 尾部 -->
	<div class="footer"></div>
	<footer class="layui-bg-cyan">
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
});
$( "#logout" ).click(function() {
	  layer.confirm("确定退出吗", {
		    yes:function(){
		    //
		    	window.location.reload();
		    }
		});
	  
	});
</script>
</html>