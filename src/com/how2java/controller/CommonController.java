package com.how2java.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class CommonController {
	
	@RequestMapping("logout")
	public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		String json = "{\"result\":\"success\"}";
		json = gson.toJson(json);
		PrintWriter out = response.getWriter();
		out.write(json);
	}
}
