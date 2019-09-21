<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	HttpSession a = request.getSession();
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>TRY1T</title>
<base href=" <%=basePath%>">
<meta name="keywords" content="blog" />
<meta name="description" content="blog" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/base.css" rel="stylesheet">
<link href="css/m.css" rel="stylesheet">
<script src="js/jquery-1.8.3.min.js"></script>
<script src="js/comm.js"></script>
<!--[if lt IE 9]>
<script src="js/modernizr.js"></script>
<![endif]-->
</head>
<body>
	<!--top begin-->
	<header id="header">
		<div class="navbox">
			<h2 id="mnavh">
				<span class="navicon"></span>
			</h2>
			<div class="logo">
				<a href="#">HANS ZHANG</a>
			</div>
			<nav>
				<ul id="starlist">
					<li><a href="jsp/frontend/frontend.jsp">首页</a></li>
					<li><a href="jsp/frontend/blog.jsp">Blog&项目展示&技术分享</a></li>
					<li><a href="jsp/frontend/about.jsp">关于我</a></li>
					<li><a href="jsp/backend.jsp">后端入口</a></li>		
				</ul>
			</nav>
			<div class="searchico"></div>
		</div>
	</header>
	<div class="searchbox">
		<div class="search">
			<form action="/e/search/index.php" method="post" name="searchform"
				id="searchform">
				<input name="keyboard" id="keyboard" class="input_text"
					value="请输入关键字词" style="color: rgb(153, 153, 153);"
					onFocus="if(value=='请输入关键字词'){this.style.color='#000';value=''}"
					onBlur="if(value==''){this.style.color='#999';value='请输入关键字词'}"
					type="text"> <input name="show" value="title" type="hidden">
				<input name="tempid" value="1" type="hidden"> <input
					name="tbname" value="news" type="hidden"> <input
					name="Submit" class="input_submit" value="搜索" type="submit">
			</form>
		</div>
		<div class="searchclose"></div>
	</div>
	<!--top end-->
	<article>
		<!--lbox begin-->
		<div class="lbox">
			<div class="whitebg lanmu">
				<img src="images/lm01.jpg">
				<h1>个人博客日记</h1>
				<p>个人博客日记，记录一些优秀个人站长是如何制作个人博客，建个人博客、以及经营个人网站的，本站还会推荐一些优秀的个人博客站长网站。</p>
			</div>
			<div class="whitebg bloglist">
				<h2 class="htitle">最新博文</h2>
				<ul>
					<!--多图模式 置顶设计-->
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank"><b>【顶】</b>别让这些闹心的套路，毁了你的网页设计!</a>
						</h3> <span class="bplist"><a href="/"> <img
								src="images/b02.jpg" alt=""></a> <a href="/"><img
								src="images/b03.jpg" alt=""></a> <a href="/"><img
								src="images/b04.jpg" alt=""> </a><a href="/"><img
								src="images/b05.jpg" alt=""> </a></span>
						<p class="blogtext">如图，要实现上图效果，我采用如下方法：1、首先在数据库模型，增加字段，分别是图片2，图片3。2、增加标签模板，用if，else
							if 来判断，输出。思路已打开，样式调用就可以多样化啦！...</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p>
					</li>
					<!--单图-->
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">原创模板</a></i><a
							href="/" title=""><img src="images/b01.jpg" alt=""></a></span>
						<p class="blogtext">这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）！...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">宝宝个人博客模板-亲子博客模板-宝宝个人网站模板</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">最新模板</a></i><a
							href="/" title=""><img src="images/b02.jpg" alt=""></a></span>
						<p class="blogtext">这是一个记录宝宝成长点滴的个人博客，用作于宝宝博客，亲子博客，都是适用的。颜色为蓝色调，头部有飘动的卡通云，采用css3动画效果，布局简单，代码精简，还有相册功能，发图片，视频，时间轴可记录重要时刻，也可记录宝宝的生长发育状况，也可以统计宝宝博客网站的所有文章...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">最新模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">如何快速建立自己的个人博客网站</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">快速建站</a></i><a
							href="/" title=""><img src="images/b03.jpg" alt=""></a></span>
						<p class="blogtext">各大博客门户网站，相继关闭，做一个独立的个人博客网站，那是将来的趋势。越来越多的个人站长倾向于独立建站，有个属于自己的博客网站，那如何快速建立自己的个人博客网站呢，接下来，我就简单给大家介绍一下：以阿里云为例...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">快速建站</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">作为一个设计师,如果遭到质疑你是否能恪守自己的原则?</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">设计制作</a></i><a
							href="/" title=""><img src="images/b04.jpg" alt=""></a></span>
						<p class="blogtext">就拿我自己来说吧，有时候会很矛盾，设计好的作品，不把它分享出来，会觉得待在自己电脑里面实在是没有意义。干脆就发布出去吧。我也害怕收到大家不好的评论，有些评论，可能说者无意，但是对于每一个用心的站长来说，都会受很深的影响，愤怒，恼羞。...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">设计制作</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<!--纯文字-->
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">别让这些闹心的套路，毁了你的网页设计!</a>
						</h3>
						<p class="blogtext">如图，要实现上图效果，我采用如下方法：1、首先在数据库模型，增加字段，分别是图片2，图片3。2、增加标签模板，用if，else
							if 来判断，输出。思路已打开，样式调用就可以多样化啦！...</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">别让这些闹心的套路，毁了你的网页设计!</a>
						</h3>
						<p class="blogtext">如图，要实现上图效果，我采用如下方法：1、首先在数据库模型，增加字段，分别是图片2，图片3。2、增加标签模板，用if，else
							if 来判断，输出。思路已打开，样式调用就可以多样化啦！...</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<!--单图-->
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">原创模板</a></i><a
							href="/" title=""><img src="images/b01.jpg" alt=""></a></span>
						<p class="blogtext">这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）！...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">如何快速建立自己的个人博客网站</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">快速建站</a></i><a
							href="/" title=""><img src="images/b03.jpg" alt=""></a></span>
						<p class="blogtext">各大博客门户网站，相继关闭，做一个独立的个人博客网站，那是将来的趋势。越来越多的个人站长倾向于独立建站，有个属于自己的博客网站，那如何快速建立自己的个人博客网站呢，接下来，我就简单给大家介绍一下：以阿里云为例...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">快速建站</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">原创模板</a></i><a
							href="/" title=""><img src="images/3.jpg" alt=""></a></span>
						<p class="blogtext">这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）！...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">如何快速建立自己的个人博客网站</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">快速建站</a></i><a
							href="/" title=""><img src="images/b01.jpg" alt=""></a></span>
						<p class="blogtext">各大博客门户网站，相继关闭，做一个独立的个人博客网站，那是将来的趋势。越来越多的个人站长倾向于独立建站，有个属于自己的博客网站，那如何快速建立自己的个人博客网站呢，接下来，我就简单给大家介绍一下：以阿里云为例...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">快速建站</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
					<li>
						<h3 class="blogtitle">
							<a href="/" target="_blank">【个人博客网站制作】自己不会个人博客网站制作，你会选择用什么博客程序源码？</a>
						</h3> <span class="blogpic imgscale"><i><a href="/">原创模板</a></i><a
							href="/" title=""><img src="images/3.jpg" alt=""></a></span>
						<p class="blogtext">这些开源的博客程序源码，都是经过很多次版本测试的，都有固定的使用人群。我所知道的主流的博客程序有，Z-blog，Emlog，WordPress，Typecho等，免费的cms系统有，织梦cms（dedecms），phpcms，帝国cms（EmpireCMS）！...
						</p>
						<p class="bloginfo">
							<i class="avatar"><img src="images/avatar.jpg"></i><span>杨青青</span><span>2018-10-28</span><span>【<a
								href="/">原创模板</a>】
							</span>
						</p> <a href="/" class="viewmore">阅读更多</a>
					</li>
				</ul>
				<!--pagelist-->
				<div class="pagelist">
					<a title="Total record">&nbsp;<b>67</b>
					</a>&nbsp;&nbsp;&nbsp;<b>1</b>&nbsp;<a href="/download/index_2.html">2</a>&nbsp;<a
						href="/download/index_3.html">3</a>&nbsp;<a
						href="/download/index_2.html">下一页</a>&nbsp;<a
						href="/download/index_3.html">尾页</a>
				</div>
				<!--pagelist end-->
			</div>

			<!--bloglist end-->
		</div>
		<div class="rbox">
			<div class="whitebg notice">
				<h2 class="htitle">网站公告</h2>
				<ul>
					<li><a href="/">十条设计原则教你学会如何设计网页布局!</a></li>
					<li><a href="/">用js+css3来写一个手机栏目导航</a></li>
					<li><a href="/">6条网页设计配色原则,让你秒变配色高手</a></li>
					<li><a href="/">三步实现滚动条触动css动画效果</a></li>
				</ul>
			</div>
			<div class="whitebg paihang">
				<h2 class="htitle">点击排行</h2>
				<section class="topnews imgscale">
					<a href="/"><img src="images/h1.jpg"><span>6条网页设计配色原则,让你秒变配色高手</span></a>
				</section>
				<ul>
					<li><i></i><a href="/">十条设计原则教你学会如何设计网页布局!</a></li>
					<li><i></i><a href="/">用js+css3来写一个手机栏目导航</a></li>
					<li><i></i><a href="/">6条网页设计配色原则,让你秒变配色高手</a></li>
					<li><i></i><a href="/">三步实现滚动条触动css动画效果</a></li>
					<li><i></i><a href="/">个人博客，属于我的小世界！</a></li>
					<li><i></i><a href="/">安静地做一个爱设计的女子</a></li>
					<li><i></i><a href="/">个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</a></li>
					<li><i></i><a href="/">做个人博客如何用帝国cms美化留言增加头像选择</a></li>
				</ul>
			</div>
			<div class="whitebg tuijian">
				<h2 class="htitle">站长推荐</h2>
				<section class="topnews imgscale">
					<a href="/"><img src="images/h2.jpg"><span>6条网页设计配色原则,让你秒变配色高手</span></a>
				</section>
				<ul>
					<li><a href="/"><i><img src="images/text01.jpg"></i>
							<p>十条设计原则教你学会如何设计网页布局!</p> </a></li>
					<li><a href="/"><i><img src="images/text02.jpg"></i>
							<p>用js+css3来写一个手机栏目导航</p> </a></li>
					<li><a href="/"><i><img src="images/text03.jpg"></i>
							<p>6条网页设计配色原则,让你秒变配色高手</p> </a></li>
					<li><a href="/"><i><img src="images/text04.jpg"></i>
							<p>三步实现滚动条触动css动画效果</p> </a></li>
					<li><a href="/"><i><img src="images/text05.jpg"></i>
							<p>个人博客，属于我的小世界！</p> </a></li>
					<li><a href="/"><i><img src="images/text06.jpg"></i>
							<p>安静地做一个爱设计的女子</p> </a></li>
					<li><a href="/"><i><img src="images/text07.jpg"></i>
							<p>个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。</p> </a></li>
				</ul>
			</div>
			<div class="whitebg tongji">
				<h2 class="htitle">站点信息</h2>
				<ul>
					<li><b>建站时间</b>：2018-10-24</li>
					<li><b>网站程序</b>：帝国CMS7.5</li>
					<li><b>主题模板</b>：<a href="#" target="_blank">《今夕何夕》</a></li>
					<li><b>文章统计</b>：299条</li>
					<li><b>文章评论</b>：490条</li>
					<li><b>统计数据</b>：<a href="/">百度统计</a></li>
					<li><b>微信公众号</b>：扫描二维码，关注我们</li>
					<img src="images/wxgzh.jpg" class="tongji_gzh">
				</ul>
			</div>
		</div>
	</article>
	<footer>
		<div class="box">
			<div class="wxbox">
				<ul>
					<li><img src="images/wxgzh.jpg"><span>微信公众号</span></li>
					<li><img src="images/wx.png"><span>我的微信</span></li>
				</ul>
			</div>
			<div class="endnav">
				<p>
					<b>TRY1T</b>
				</p>
				<p>
					Copyright © <a href="#" target="_blank">www.try1t.com</a> All
					Rights Reserved.
				</p>
			</div>
		</div>
		<a href="#">
			<div class="top"></div>
		</a>
	</footer>
</body>
</html>
