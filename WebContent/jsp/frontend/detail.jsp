<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String username = (String) session.getAttribute("username");
	String url = (String) session.getAttribute("url");
	if (url == null) {
		url = "images/default.jpg";
	} else {
		url = "images/avatar/" + url;
	}
	String fill = "";
	String href = "";
	String display = "";
	String display1 = "";
	String display2 = "";
	String category = "";
	String cate = (String) request.getAttribute("category");
	if (cate.equals("0")) {
		category = "分享";
	} else if (cate.equals("1")) {
		category = "新闻";
	} else if (cate.equals("2")) {
		category = "笔记";
	} else if (cate.equals("3")) {
		category = "展示";
	} else if (cate.equals("4")) {
		category = "大事件";
	}
	if (username == null) {
		username = "请登录";
		href = "/ssm/login.jsp";
		display = "display:none";
	} else {
		href = "javascript:;";
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
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<title>${title}</title>
<base href=" <%=basePath%>">
<link rel="stylesheet" href="lib/layui/css/layui.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/detail.css">
<link rel="icon" href="images/icon.jpg">
</head>
<body>
	<header style="background-color: #254b50;">
		<nav class="layui-container">
			<ul style="background-color: transparent" class="layui-nav">
				<li style="margin-left: -20px" class="layui-nav-item">	
				<a href="frontend">TRY1T BLOG</a>
				<li class="layui-nav-item"><a href="javascript:;">分类</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="cate?category=0">分享</a>
						</dd>
						<dd>
							<a href="cate?category=1">新闻</a>
						</dd>
						<dd>
							<a href="cate?category=2">笔记</a>
						</dd>
						<dd>
							<a href="cate?category=3">展示</a>
						</dd>
						<dd>
							<a href="cate?category=4">大事件</a>
						</dd>
					</dl></li>
				<li style="float: right; margin-right: -20px" class="layui-nav-item">
					<a href="<%=href%>"><img src="<%=url%>" class="layui-nav-img"><%=username%></a>
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
						<c:forEach items="${cs}" var="c" varStatus="st">
							<div class="main">
								<div class="title">
									<p>${c.title}</p>
									<input style="display: none" id="blogid" value="${c.id}">
									<div class="layui-row stat">
										<div class="layui-col-md3 layui-col-xs12">
											发布时间：<em>${c.date}</em>
										</div>
										<div class="layui-col-md2 layui-col-xs6">
											分类：<a><%=category%></a>
										</div>
										<div class="layui-col-md2 layui-col-xs6">
											作者：<a>${c.username}</a>
										</div>
										<div class="layui-col-md5 layui-col-xs12">
											<div class="layui-row">
												<div class="layui-col-md6 layui-col-xs6">
													<i class="layui-icon layui-icon-reply-fill"></i> <em>${cono}条评论</em>
												</div>
												<div class="layui-col-md6 layui-col-xs6">
													<i class="layui-icon layui-icon-read"></i> <em>${c.views}</em>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="content">${c.content}</div>
								<div class="copyright">
									<p>转载声明：本站文章若无特别说明，皆为转载</p>
								</div>
								<div class="Label">
									<i class="layui-icon layui-icon-note"></i>
								</div>
							</div>
						</c:forEach>


					</div>
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div style="border-radius: 10px" class="layui-card">
							<div class="layui-card-body title">
								<p style="display:inline">评论</p>					
							<button style="display:inline;float:right" id="submitbutton" class="layui-btn layui-btn-xs">发表评论</button>
							</div>	
						</div>
					</div>
					
					<div class="layui-col-md12 margin20"></div>
					<div class="layui-col-md12">
						<div class="layui-card">
							<textarea id="demo" style="display: none;"></textarea>
						</div>
					</div>
					<div class="layui-col-md12 margin20"></div>
					<c:forEach items="${comment}" var="co" varStatus="st">
						<div class="layui-col-md12 margin10"></div>
						<div style="border-radius: 10px;"
							class="layui-col-md12  layui-card">
							<div class="layui-card-header">
								${co.username}&emsp;&emsp;&emsp;&emsp;&emsp;${co.date}
								<div style="float: right; margin-right: 10px" class="alink">
									<a onclick="comment_del('${co.id}')" style="${co.display}"
										class="layui-btn layui-btn-xs">删除评论</a>
								</div>
								<span class="layui-breadcrumb" lay-separator="|"></span>
							</div>
							<div class="layui-card-body">${co.content}</div>
						</div>
					</c:forEach>
				</div>

			</div>


			<div class="layui-col-md4">
				<div class="layui-row">
					<div class="layui-col-md12">
						<div style="border-radius: 10px;" class="layui-card">
							<div class="layui-card-header">
								<span> 热门文章 </span>
							</div>
							<div class="layui-card-body">
								<table class="layui-table" lay-skin="nob">
									<tbody>
										<tr>
											<td><a
												href="http://www.try1t.com/ssm/detail?id=07600633-1ef0-4acb-a01f-429f183f6376">怎么看待甲骨文停止对于Java
													EE的开发？</a></td>
										</tr>
										<tr>
											<td><a
												href="http://www.try1t.com/ssm/detail?id=1e330f23-33ba-4d72-8970-fa233379742c">EE半导体背景phd转行ML以及跳槽经历分享
											</a></td>
										</tr>
										<tr>
											<td><a
												href="http://www.try1t.com/ssm/detail?id=6b21c13e-d74b-4ae9-bd0d-faa77f859446">css居中问题
											</a></td>
										</tr>
										<tr>
											<td><a
												href="http://www.try1t.com/ssm/detail?id=9db15cc2-e21d-45eb-809f-36ec476d71f3">S9小组出局创最差成绩，RNG的实力是个谜</a></td>
										</tr>
										<tr>
											<td><a
												href="http://www.try1t.com/ssm/detail?id=b6fc25d0-1d01-4337-955a-e2bc8773a257">脑门贴张纸，骗过最强人脸识别系统！</a></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 尾部 -->
	<div class="footer"></div>
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
	layui
			.use(
					[ 'layedit', 'form', 'layer' ],
					function() {
						$ = layui.jquery;
						var layer = layui.layer;
						layui.carousel.render({
							elem : '#carousel',
							width : '100%' //设置容器宽度
							,
							arrow : 'always' //始终显示箭头
						//,anim: 'updown' //切换动画方式
						});
						var layedit = layui.layedit;
						var editor = layedit.build('demo', {
							tool : [ 'strong', 'italic', 'underline', 'link',
									'unlink', '|', 'face' ],
							height : 150
						});

						$(function() {
							$("#submitbutton")
									.click(
											function() {

												var rawdata = {
													"content" : layedit
															.getContent(editor)
												};
												var data = JSON
														.stringify(rawdata);

												$
														.ajax({
															type : "POST",
															contentType : "application/x-www-form-urlencoded; charset=utf-8",
															url : "/ssm/addcomment?blogid="
																	+ encodeURI(encodeURI($(
																			"#blogid")
																			.val())),
															data : data,
															dataType : "json",
															success : function(
																	data) {
																var obj = JSON
																		.parse(data);
																if (obj.result == "success") {
																	layer
																			.alert(
																					'评论成功！',
																					{
																						yes : function() {
																							window.location
																									.reload();
																						}
																					});
																} else if (obj.result == "fail") {
																	layer
																			.alert("评论失败")
																}
															},
															error : function(e) {
																layer
																		.alert("评论失败-debug");
															}
														});
											});
						});

						$("#logout")
								.click(
										function() {

											layer
													.confirm(
															"确定退出吗",
															{
																yes : function() {
																	$
																			.ajax({
																				type : "POST",
																				contentType : "application/json",
																				url : "/ssm/logout",
																				data : "",
																				dataType : "json",
																				success : function(
																						data) {
																					var obj = JSON
																							.parse(data);
																					if (obj.result == "success") {
																						window.location
																								.reload();
																					} else if (obj.result == "fail") {
																						layer
																								.alert("error-debug1")
																					}
																				},
																				error : function(
																						e) {
																					layer
																							.alert("error-debug2");
																					window.location.href = "/ssm/frontend";
																				}
																			});
																}
															});

										});

					});
	function comment_del(id) {
		var cid = id;

		layer
				.confirm(
						'确认删除',
						{
							yes : function() {
								$
										.ajax({
											type : "POST",
											contentType : "application/x-www-form-urlencoded; charset=utf-8",
											url : "/ssm/delcomment?id=" + cid,
											data : "",
											dataType : "json",
											success : function(data) {
												var obj = JSON.parse(data);
												if (obj.result == "success") {
													layer.alert('删除成功！', {
														yes : function() {
															window.location
																	.reload();
														}
													});
												} else if (obj.result == "fail") {
													layer.alert("删除失败")
												}
											},
											error : function(e) {
												layer.alert("删除失败-debug");
											}
										});
							}
						});
	}
</script>
<script>
	
</script>
</html>