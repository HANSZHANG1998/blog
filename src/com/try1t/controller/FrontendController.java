package com.try1t.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.try1t.pojo.Blog;
import com.try1t.pojo.Comment;
import com.try1t.pojo.User;
import com.try1t.service.BlogService;
import com.try1t.service.CommentService;
import com.try1t.service.UserService;

@Controller
public class FrontendController {
	@Autowired
	BlogService blogService;
	@Autowired
	UserService userService;
	@Autowired
	CommentService commentService;
	
	@RequestMapping("frontend")
	public ModelAndView frontend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		String a = (String)request.getParameter("pagenum");
		List<Blog> cs = blogService.list();
		int current = currentPage(a);
		int total = total(cs);
		List<Blog> New = currentList(current,total,cs);
		String username = (String) session.getAttribute("username");
		String url = (String) session.getAttribute("url");
		if (url == null) {
			url = "images/default.jpg";
		} else {
			url = "images/avatar/" + url;
		}
		String fill = "";
		String href = "";
		String display1 = "";
		String display2 = "";
		if (username == null) {
			username = "请登录";
			href = "/ssm/login.jsp";
		} else {
			href = "javascript:;";
			fill = "<dl class='layui-nav-child'><dd><a href='account'>个人中心</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
		}
		if (current == 1) {
			display1 = "display:none";
		}
		if (current == total) {
			display2 = "display:none";
		}
		
		List<User> cs2 = userService.list();
		for(int i = 0; i < cs.size(); i++) {
		String id = cs.get(i).getId();
		CommonMethods methods = new CommonMethods();
		String temp;
		temp = cs.get(i).getContent();
		temp = methods.removeHtmlTag(temp);
		cs.get(i).setContent(temp);
		int commentno = commentService.list(id).size();
		cs.get(i).setCounts(commentno);
		}
		mav.addObject("articlecount", cs.size());
		mav.addObject("usercount", cs2.size());
		mav.addObject("username", username);
		mav.addObject("url", url);
		mav.addObject("fill",fill);
		mav.addObject("href",href);
		mav.addObject("display1",display1);
		mav.addObject("display2",display2);
		mav.addObject("cs", New);
		mav.setViewName("frontend/frontend");
		mav.addObject("prev", current - 1);
		mav.addObject("next", current + 1);
		mav.addObject("pagenum", current);
		mav.addObject("last", total);
		return mav;
	}


	@RequestMapping("detail")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		List<Blog> cs = blogService.getById(id);
		List<Comment> comment = commentService.list(id);
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		String url = (String) session.getAttribute("url");
		for(int i = 0; i < comment.size(); i++)
		{
			if(!comment.get(i).getUsername().equals(username)) {
			comment.get(i).setDisplay("display:none");
			}
		}
		
		
		if (url == null) {
			url = "images/default.jpg";
		} else {
			url = "images/avatar/" + url;
		}
		String fill = "";
		String href = "";
		String display1 = "";
		String display2 = "";
		if (username == null) {
			username = "请登录";
			href = "/ssm/login.jsp";
		} else {
			href = "javascript:;";
			fill = "<dl class='layui-nav-child'><dd><a href='account'>个人中心</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
		}
		
		Blog blog = new Blog();
		blog.setId(id);
		String category = cs.get(0).getCategory();
		int views = cs.get(0).getViews();
		views++;
		blog.setViews(views);
		blogService.updateViews(blog); 
		mav.addObject("cs", cs);
		mav.addObject("comment",comment);
		mav.addObject("title", cs.get(0).getTitle());
		mav.addObject("category", category);
		mav.addObject("cono",comment.size());
		mav.addObject("url", url);
		mav.addObject("fill",fill);
		mav.addObject("href",href);
		mav.addObject("display1",display1);
		mav.addObject("display2",display2);
		mav.addObject("username",username);
		mav.setViewName("frontend/detail");
		return mav;
	}

	@RequestMapping("search")
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		int current;
		if (request.getParameter("pagenum") == null) {
			current = 1;
		} else {
			current = Integer.parseInt(request.getParameter("pagenum"));
		}
		String content = (String)request.getParameter("content");
		List<Blog> cs = blogService.searchlike(content);
		int total = cs.size() / 10;
		if(cs.isEmpty()) {
			total = 1;
		}
		else if (total * 10 != cs.size()) {
			total = total + 1;
		}
		List<Blog> newblog;
		System.out.println("total" + total + "current" + current);
		if (current != total) {
			newblog = cs.subList((current - 1) * 10, (current) * 10);
		} else {
			newblog = cs.subList((current - 1) * 10, cs.size());
		}	
		for(int i = 0; i < cs.size(); i++) {
		CommonMethods methods = new CommonMethods();
		String temp;
		temp = cs.get(i).getContent();
		temp = methods.removeHtmlTag(temp);
		cs.get(i).setContent(temp);
		}
		List<User> cs2 = userService.list();
		mav.addObject("articlecount", cs.size());
		mav.addObject("usercount", cs2.size());
		mav.addObject("search", content);
		if(content == "") {
			mav.addObject("cs", null);
		}else {
			mav.addObject("cs", newblog);
		}
		
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		String url = (String)session.getAttribute("url");
		if(url == null){
			url = "images/default.jpg";
		}else{
			url = "images/avatar/" + url;
		}

		String fill = "";
		String href = "";
		String display1 = "";
		String display2 = "";
		if(username == null){
			username = "请登录";
			href = "/ssm/login.jsp";
			}
		else{
			href="javascript:;";
			fill = "<dl class='layui-nav-child'><dd><a href='account'>个人中心</a></dd><dd><a id='logout' href='javascript:;'>退出</a></dd></dl>";
		}
		if(current == 1){
			display1 = "display:none";
		}
		if(current == total){
			display2 = "display:none";
		}
		mav.addObject("url", url);
		mav.addObject("fill",fill);
		mav.addObject("href",href);
		mav.addObject("display1",display1);
		mav.addObject("display2",display2);
		mav.setViewName("frontend/search");
		mav.addObject("prev", current - 1);
		mav.addObject("next", current + 1);
		mav.addObject("pagenum", current);
		mav.addObject("last", total);
		mav.addObject("username",username);
		return mav;
	}

	//category
	@RequestMapping("cate")
	public ModelAndView cate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ModelAndView mav = new ModelAndView();
		String current  = (String) request.getParameter("current");
		String category  = (String) request.getParameter("category");
		int currentpage = 0;
		if(current == null) {
			currentpage = 1;
		}else {
			currentpage = Integer.parseInt(current);
		}
		int pages;
		List<Blog> cs = blogService.getBlogByCategory(category);
		if(cs.isEmpty()) {
			pages = 1;
		}else {
			if(cs.size()%10 != 0) {
		pages = (cs.size()/10) + 1;
		}else {
			pages = cs.size()/10;
		}
		}
		if(currentpage == pages){
			cs = cs.subList((currentpage-1)*10, cs.size());
		}else {
			cs = cs.subList((currentpage-1)*10, currentpage*10-1);
		}
		for(int i = 0; i < cs.size(); i++) {
		CommonMethods methods = new CommonMethods();
		String temp;
		temp = cs.get(i).getContent();
		temp = methods.removeHtmlTag(temp);
		cs.get(i).setContent(temp);
		}
		List<User> cs2 = userService.list();
		mav.addObject("articlecount", cs.size());
		mav.addObject("usercount", cs2.size());
		request.setAttribute("category", category);
		mav.addObject("cs", cs);
		mav.setViewName("frontend/category");
		request.setAttribute("current", currentpage);
		request.setAttribute("pages", pages);
		return mav;
	}
	
	public int currentPage(String check) {
		int current;
		if (check == null) {
			current = 1;
		} else {
			current = Integer.parseInt(check);
		}
		return current;
	}
	
	public int total (List<Blog> list) {
		int total = list.size() / 10;
		if (total * 10 != list.size()) {
			total = total + 1;
		}
		return total;
	}
	
	public List<Blog> currentList(int current,int total,List<Blog> list) {
		if (current != total) {
			list = list.subList((current - 1) * 10, (current) * 10);
		} else {
			list = list.subList((current - 1) * 10, list.size());
		}	
		return list;
	}
	
}


