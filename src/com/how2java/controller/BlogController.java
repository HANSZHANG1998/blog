package com.how2java.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.how2java.pojo.Blog;
import com.how2java.pojo.Tag;
import com.how2java.service.BlogService;
import com.how2java.service.TagService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class BlogController {
	
	@Autowired
	BlogService blogService;
	@Autowired
	TagService tagService;
	
	@RequestMapping("blog-add")
	public void blogadd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String subtitle = URLDecoder.decode(request.getParameter("subtitle"),"UTF-8");
		String content = URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String username = "admin";
		String id1 = URLDecoder.decode(request.getParameter("id1"),"UTF-8");
		String id2 = URLDecoder.decode(request.getParameter("id2"),"UTF-8");
		String id3 = URLDecoder.decode(request.getParameter("id3"),"UTF-8");
		String category = URLDecoder.decode(request.getParameter("category"),"UTF-8");
		String top = URLDecoder.decode(request.getParameter("top"),"UTF-8");
		
		// 处理数据
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		Date curTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(curTime);
		Blog blog = new Blog();
		blog.setId(id);
		blog.setTitle(title);
		blog.setSubtitle(subtitle);
		blog.setUsername(username);
		blog.setArticle("article");
		blog.setState("publish");
		blog.setDate(date);
		blog.setContent(content);
		blog.setViews("0");
		blog.setCategory(category);
		blog.setTop(top);
		Tag tag = new Tag();
		tag.setId1(id1);
		tag.setId2(id2);
		tag.setId3(id3);
		tag.setUserid(id);
		tagService.add(tag);
		// 返回json值
		String json = "";
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
			try {
			    blogService.add(blog);
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
			} catch (Exception e) {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);
			}
		
	}
	
	@RequestMapping("blog-list")
	public ModelAndView bloglist(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int current;
		if (request.getParameter("pagenum") == null) {
			current = 1;
		} else {
			current = Integer.parseInt(request.getParameter("pagenum"));
		}
		ModelAndView mav = new ModelAndView();
		List<Blog> cs = blogService.list();
		List<Blog> newblog;
		int total = cs.size() / 10;
		if (total * 10 != cs.size()) {
			total = total + 1;
		}
		if (current != total) {
			newblog = cs.subList((current - 1) * 10, (current) * 10);
		} else {
			newblog = cs.subList((current - 1) * 10, cs.size());
		}
		mav.addObject("cs", newblog);
		mav.setViewName("blog/blog-list");
		mav.addObject("count", cs.size());
		HttpSession session = request.getSession();
		session.setAttribute("pagenum", current);
		session.setAttribute("count", cs.size());
		return mav;
	}
	
	@RequestMapping("blog-delete")
	public ModelAndView blogdel(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		blogService.delete(id);
		return new ModelAndView("redirect:" + "/blog-list");
	}
	
	@RequestMapping("blog-search")
	public ModelAndView blogsearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if (!request.getParameter("id").equals("")) {
			String id = request.getParameter("id");
			List<Blog> cs = blogService.getById(id);
			mav.addObject("cs", cs);
			mav.setViewName("blog/blog-search");
			mav.addObject("count", cs.size());
			return mav;
		} else {
			return new ModelAndView("redirect:" + "/blog-list");
		}
	}

	@RequestMapping("blog-getdata")
	public ModelAndView bloggetdata(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		List<Blog> cs = blogService.getById(id);
		mav.addObject("cs", cs);
		mav.setViewName("blog/blog-edit");
		return mav;
	}
	
	@RequestMapping("blog-edit")
	public void blogedit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接受request数据
		String title = URLDecoder.decode(request.getParameter("title"),"UTF-8");
		String subtitle = URLDecoder.decode(request.getParameter("subtitle"),"UTF-8");
		String content = URLDecoder.decode(request.getParameter("content"),"UTF-8");
		String id = URLDecoder.decode(request.getParameter("id"),"UTF-8");
		String top = URLDecoder.decode(request.getParameter("top"),"UTF-8");
		String category = URLDecoder.decode(request.getParameter("category"),"UTF-8");
		
		
		// 处理数据
		Blog blog = new Blog();
		blog.setId(id);
		blog.setTitle(title);
		blog.setSubtitle(subtitle);
		blog.setUsername("admin");
		blog.setArticle("article");
		blog.setCategory(category);
		blog.setTop(top);
		blog.setState("publish");
		blog.setContent(content);


		// 返回json值
		String json = "";
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			try {
			    blogService.update(blog);
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
			} catch (Exception e) {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);
			}
		
	}
	
	@RequestMapping("frontend")
	public ModelAndView frontend(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int current;
		if (request.getParameter("pagenum") == null) {
			current = 1;
		} else {
			current = Integer.parseInt(request.getParameter("pagenum"));
		}
		ModelAndView mav = new ModelAndView();
		List<Blog> cs = blogService.list();
		List<Blog> newblog;
		int total = cs.size() / 10;
		if (total * 10 != cs.size()) {
			total = total + 1;
		}
		if (current != total) {
			newblog = cs.subList((current - 1) * 10, (current) * 10);
		} else {
			newblog = cs.subList((current - 1) * 10, cs.size());
		}
		mav.addObject("cs", newblog);
		mav.setViewName("frontend/frontend");
		mav.addObject("count", cs.size());
		HttpSession session = request.getSession();
		session.setAttribute("pagenum", current);
		session.setAttribute("count", cs.size());
		return mav;
	}
	
	@RequestMapping("userweb")
	public ModelAndView userweb(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		int current;
		if (request.getParameter("pagenum") == null) {
			current = 1;
		} else {
			current = Integer.parseInt(request.getParameter("pagenum"));
		}
		ModelAndView mav = new ModelAndView();
		List<Blog> cs = blogService.getBlogByUsername(username);
		List<Blog> newblog;
		int total = cs.size() / 10;
		if (total * 10 != cs.size()) {
			total = total + 1;
		}
		if (current != total) {
			newblog = cs.subList((current - 1) * 10, (current) * 10);
		} else {
			newblog = cs.subList((current - 1) * 10, cs.size());
		}
		mav.addObject("cs", newblog);
		mav.setViewName("frontend/userweb");
		mav.addObject("count", cs.size());
		
		session.setAttribute("pagenum", current);
		session.setAttribute("count", cs.size());
		return mav;
	}
	
	@RequestMapping("detail")
	public ModelAndView detail(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		List<Blog> cs = blogService.getById(id);
		mav.addObject("cs", cs);
		mav.setViewName("frontend/detail");
		return mav;
	}
	
}