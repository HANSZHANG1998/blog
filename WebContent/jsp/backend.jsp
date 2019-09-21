<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    HttpSession a = request.getSession();
%>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Welcome</title>
	    <base href=" <%=basePath%>"> 
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="css/font.css">
	<link rel="stylesheet" href="css/xadmin.css">
		<link rel="stylesheet" href="css/theme10.css">
	
    <script src="js/jquery.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>

</head>
<body>
    <!--  -->
    <div class="container">
        <div class="logo"><a href="index.jsp">TRYIT v2.0</a></div>
        <div class="left_open">
            <i title="Welcome" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">admin</a>
            <dl class="layui-nav-child"> <!-- -->
              <dd><a onClick="x_admin_show('a','http://www.baidu.com')">admin</a></dd>
              <dd><a onClick="x_admin_show('b','http://www.baidu.com')">settings</a></dd>
              <dd><a href="login.jsp">logout</a></dd>
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- -->
    <!-- -->
     <!-- -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>成员管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="member-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>成员管理</cite>
                        </a>
                    </li >
                </ul>    
            </li>       
                 
              <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe726;</i>
                    <cite>博客管理</cite>
                    <i class="iconfont nav_right">&#xe6a7;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="blog-list">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>文章管理</cite>
                        </a>
                    </li >
                </ul>
                
                                <ul class="sub-menu">
                    <li>
                        <a _href="jsp/blog/blog-add.jsp">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>标签管理</cite>
                        </a>
                    </li >
                </ul>
            </li>            

		  </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- å·¦ä¾§èåç»æ -->
    <!-- å³ä¾§ä¸»ä½å¼å§ -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>home</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='jsp/welcome.jsp' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- -->
    <!-- -->
    <!-- -->
    <!--<div class="footer">
    </div>-->
    <!--  -->
</body>
</html>