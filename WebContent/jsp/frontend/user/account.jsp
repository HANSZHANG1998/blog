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
	<link rel="icon" href="images/icon.jpg">
</head>
<body>
<header style="background-color: #254b50;">
		<nav class="layui-container">
		<ul style="background-color: transparent" class="layui-nav">
 			    	    <li style="margin-left:-20px" class="layui-nav-item layui-this">
					   	<a href="frontend">TRY1T BLOG</a>
					  	</li>
  <li style="float:right;margin-right:-20px" class="layui-nav-item">
     <a href="<%=href%>"><img src="<%=url%>" class="layui-nav-img"><%=username%></a><%=fill%>
  </li>
     </ul>
		</nav>
	</header>
	<div style="height:80px;"></div>
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
									<a href="/ssm/account"><b style="color:black">个人资料</b></a>
								</div>
								<div class="layui-breadcrumb">
									<a href="/ssm/resetpassword">密码修改</a>
								</div>
						  		<div class="layui-breadcrumb">
									<a href="/ssm/article">文章管理</a>
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
			<div style="border-radius: 10px;" class="layui-col-md12 layui-card">
                     <div class="layui-row">
				    <div class="margin20"></div>
					<form class="layui-form">
				
			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">头像</label>	
				<img style="width:100px;height:100px;border:1px solid" src="<%=url%>">
			</div>
			
		    <div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label"></label>
				<div class="layui-upload">
              <button style="width:100px" type="button" class="layui-btn" id="test1">更换头像</button>
                  <div class="layui-upload-list">
               <span id="demo1"></span>
                     <p id="demoText"></p>
              </div>
            </div> 
			</div>
			<c:forEach items="${cs}" var="c" varStatus="st">	
			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">账号</label>
				<div class="layui-input-inline">
					<input style="width:80%" type="text" id="username" class="layui-input" readonly="true" value="${c.username}">
				</div>
			</div>

			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">性别</label>
				<div class="layui-input-inline">
					<input style="width:80%" type="text" id="sex" class="layui-input" value="${c.sex}">
				</div>
			</div>

			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">手机</label>
				<div class="layui-input-inline">
					<input style="width:80%" type="text" id="phone" class="layui-input" value="${c.phone}">
				</div>
			</div>

			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">邮箱</label>
				<div class="layui-input-inline">
					<input style="width:80%" type="text" id="email" class="layui-input" value="${c.email}">
				</div>
			</div>

			<div class="layui-form-item">
				<label style="margin-left:5%" class="layui-form-label">地址</label>
				<div class="layui-input-inline">
					<input style="width:80%" type="text" id="address" class="layui-input" value="${c.address}">
				</div>
			</div>
			</c:forEach>
		</form>
		<div class="layui-form-item"><label style="margin-left:5%" class="layui-form-label"></label>
		<button id="edit" class="layui-btn">修改</button>
	    </div>
		<div class="margin10"></div>
					</div>
			</div>
	        </div>
	        <div class="margin10"></div>
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
<script>
layui.use('upload', function(){
  var $ = layui.jquery
  ,upload = layui.upload;
  
  //普通图片上传
  var uploadInst = upload.render({
    elem: '#test1'
    ,url: '/ssm/avatar'
    ,method: 'POST'
    ,done: function(res){
      if(res.code == 0){
    	setTimeout("window.location.reload();",5000);
  		layer.alert('请等待图片上传完成', {
		    yes:function(){
		    }
  		
		});
      }
      //如果上传失败
      if(res.code > 0){
        return layer.msg('上传失败');
      }
      //上传成功
    }
    ,error: function(){
      //演示失败状态，并实现重传
      layer.alert('debug-error');
    }
  });
});
</script>
</html>