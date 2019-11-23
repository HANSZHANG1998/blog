package com.how2java.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.how2java.pojo.Comment;
import com.how2java.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("addcomment")
	public void addcomment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接受request数据
		BufferedReader reader = request.getReader();
		String readerStr = "";// 接收用户端传来的JSON字符串
		String line;
		while ((line = reader.readLine()) != null) {
			readerStr = readerStr.concat(line);
		}
		@SuppressWarnings("rawtypes")
		HashMap map = JSONObject.parseObject(readerStr, HashMap.class);
		String content = (String) map.get("content");
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        if(username == null) {
        	username = "Guest";
        }
		String blogid = URLDecoder.decode(request.getParameter("blogid"),"UTF-8");
		
		// 处理数据
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		Date curTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(curTime);
		Comment comment = new Comment();
		comment.setId(id);
		comment.setBlogid(blogid);
		comment.setContent(content);
		comment.setDate(date);
		comment.setUsername(username);
		
		// 返回json值
		String json = "";
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
			try {
			    commentService.add(comment);
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
			} catch (Exception e) {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);
			}
}
	@RequestMapping("delcomment")
	public void deletecomment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = request.getParameter("id");
		
		// 返回json值
				String json = "";
				Gson gson = new GsonBuilder().disableHtmlEscaping().create();
				PrintWriter out = response.getWriter();
				response.setCharacterEncoding("utf-8");
				response.setContentType("application/json");
				response.setStatus(HttpServletResponse.SC_OK);
					try {
						commentService.delete(id);
						json = "{\"result\":\"success\"}";
						json = gson.toJson(json);
						out.write(json);
					} catch (Exception e) {
						json = "{\"result\":\"fail\"}";
						json = gson.toJson(json);
						out.write(json);
					}
	}
}
