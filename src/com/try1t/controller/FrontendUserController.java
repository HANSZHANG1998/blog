package com.try1t.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.try1t.pojo.Blog;
import com.try1t.pojo.User;
import com.try1t.service.BlogService;
import com.try1t.service.CommentService;
import com.try1t.service.UserService;

@Controller
public class FrontendUserController {

	@Autowired
	UserService userService;
	@Autowired
	BlogService blogService;
	@Autowired
	CommentService commentService;
	@RequestMapping("account")
	public ModelAndView account(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("username");
		List<User> userlist = userService.getUserByUsername(username);
		ModelAndView mav = new ModelAndView();
		mav.addObject("cs", userlist);
		mav.setViewName("frontend/user/account");
		return mav;
	}
	
	@RequestMapping("frontend-user-edit")
	public void frontendUserEdit(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String username = URLDecoder.decode(request.getParameter("username"),"UTF-8");
		String phone = URLDecoder.decode(request.getParameter("phone"),"UTF-8");
		String sex = URLDecoder.decode(request.getParameter("sex"),"UTF-8");
		String email = URLDecoder.decode(request.getParameter("email"),"UTF-8");
		String address = URLDecoder.decode(request.getParameter("address"),"UTF-8");
		User user = new User();
		user.setUsername(username);
		user.setAddress(address);
		user.setEmail(email);
		user.setPhone(phone);
		user.setSex(sex);
		String json = "";
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		try {
			userService.updateDetail(user);
			json = "{\"result\":\"success\"}";
			json = gson.toJson(json);
			out.write(json);
		} catch (Exception e) {
			json = "{\"result\":\"fail\"}";
			json = gson.toJson(json);
			out.write(json);
		}
		
	}
	
	 @RequestMapping("resetpassword")
		public ModelAndView resetpassword(HttpServletRequest request, HttpServletResponse response) throws IOException {
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("frontend/user/resetpass");
         return mav;
	 }
	 
    @RequestMapping("frontend-password-edit")
	public void passwordedit(HttpServletRequest request, HttpServletResponse response) throws IOException {
    	String username = URLDecoder.decode(request.getParameter("username"),"UTF-8");
    	String password = URLDecoder.decode(request.getParameter("password"),"UTF-8");
    	String newpassword = URLDecoder.decode(request.getParameter("newpassword"),"UTF-8");
    	String oldpass = userService.getByUsername(username).get(0);
    	User user = new User();
    	user.setUsername(username);
    	user.setPassword(newpassword);
    	String json = "";
    	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
    	if(oldpass.contentEquals(password)) {
    		try {
    		userService.updatePasswordByUsername(user);
    		json = "{\"result\":\"success\"}";
			json = gson.toJson(json);
    	}catch(Exception e) {
    		json = "{\"result\":\"fail\"}";
			json = gson.toJson(json);
    	}
    	}else {
    		json = "{\"result\":\"fail1\"}";
    		json = gson.toJson(json);
    	}
    	out.write(json);
	}
    
	@RequestMapping("article")
	public ModelAndView userweb(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		ModelAndView mav = new ModelAndView();
		String current  = (String) request.getParameter("current");
		int currentpage = 0;
		if(current == null) {
			currentpage = 1;
		}else {
			currentpage = Integer.parseInt(current);
		}
		int pages;
		List<Blog> cs = blogService.getBlogByUsername(username);
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
			String id = cs.get(i).getId();
			int commentno = commentService.list(id).size();
			cs.get(i).setCounts(commentno);

		}
		
		List<User> cs2 = userService.list();
		mav.addObject("articlecount", cs.size());
		mav.addObject("usercount", cs2.size());
		mav.addObject("cs", cs);
		mav.setViewName("frontend/user/article");
		request.setAttribute("current", currentpage);
		request.setAttribute("pages", pages);
		return mav;
	}
	
}
