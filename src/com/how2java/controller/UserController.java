package com.how2java.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.how2java.pojo.User;
import com.how2java.service.UserService;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("")
public class UserController {
	@Autowired
	UserService userService;

	@RequestMapping("login")
	public void login(HttpServletRequest request, HttpServletResponse response) throws IOException {

		// 接受json数据
		BufferedReader reader = request.getReader();
		String readerStr = "";// 接收用户端传来的JSON字符串
		String line;
		while ((line = reader.readLine()) != null) {
			readerStr = readerStr.concat(line);
		}
		@SuppressWarnings("unchecked")
		HashMap<String, String> map = JSONObject.parseObject(readerStr, HashMap.class);
		String username = (String) map.get("username");
		String password = (String) map.get("password");
		String url = userService.getUserByUsername(username).get(0).getUrl();
		HttpSession session = request.getSession();

		// 返回json值
		String json = "";
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		List<String> cs = userService.getByUsername(username);
		if (cs.size() == 0) {
			json = "{\"result\":\"fail\"}";
			json = gson.toJson(json);
			out.write(json);// invalid password
		} else {
			String data = cs.get(0);
			if (data.equals(password)) {
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
				session.setAttribute("username", username);
				session.setAttribute("url", url);
			} else {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);// login process failed-debug

			}
		}

	}

	@RequestMapping("register")
	public void register(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接收json数据
		BufferedReader reader = request.getReader();
		String readerStr = "";// 接收用户端传来的JSON字符串
		String line;
		while ((line = reader.readLine()) != null) {
			readerStr = readerStr.concat(line);
		}

		@SuppressWarnings("rawtypes")
		HashMap map = JSONObject.parseObject(readerStr, HashMap.class);
		String username = (String) map.get("username");
		String password = (String) map.get("password");
		String email = (String) map.get("email");

		// 处理数据
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		Date curTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(curTime);
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setSex(null);
		user.setPhone(null);
		user.setEmail(email);
		user.setAddress(null);
		user.setDate(date);
		user.setPassword(password);
		user.setState(null);

		// 返回json值
		String json = "";
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		List<String> cs = userService.getByUsername(username);
		if (username.equals("")) {
			json = "{\"result\":\"nullusername\"}";
			json = gson.toJson(json);
			out.write(json);
		} else if (password.equals("")) {
			json = "{\"result\":\"nullpassword\"}";
			json = gson.toJson(json);
			out.write(json);
		} else if (email.equals("")) {
			json = "{\"result\":\"nullemail\"}";
			json = gson.toJson(json);
			out.write(json);
		} else if (cs.isEmpty()) {
			try {
				userService.add(user);
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
			} catch (Exception e) {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);
			}
		} else {
			json = "{\"result\":\"fail1\"}";
			json = gson.toJson(json);
			out.write(json);
		}
	}

	@RequestMapping("member-list")
	public ModelAndView memberlist(HttpServletRequest request, HttpServletResponse response) {
		int current;
		if (request.getParameter("pagenum") == null) {
			current = 1;
		} else {
			current = Integer.parseInt(request.getParameter("pagenum"));
		}
		ModelAndView mav = new ModelAndView();
		List<User> cs = userService.list();
		List<User> newuser;
		int total = cs.size() / 10;
		if (total * 10 != cs.size()) {
			total = total + 1;
		}
		if (current != total) {
			newuser = cs.subList((current - 1) * 10, (current) * 10);
		} else {
			newuser = cs.subList((current - 1) * 10, cs.size());
		}
		mav.addObject("cs", newuser);
		mav.setViewName("member/member-list");
		mav.addObject("count", cs.size());
		if(current == 1) {
			mav.addObject("display", "display:none");
		}else {
			mav.addObject("display", "");
		}
		if(current == total) {
			mav.addObject("display2", "display:none");
		}else {
			mav.addObject("display2", "");
		}
		mav.addObject("prev", current - 1);
		mav.addObject("next", current + 1);
		mav.addObject("pagenum", current);
		mav.addObject("last", total);
		return mav;
	}

	@RequestMapping("member-search")
	public ModelAndView membersearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		if (!request.getParameter("id").equals("")) {
			String id = request.getParameter("id");
			List<User> cs = userService.getById(id);
			mav.addObject("cs", cs);
			mav.setViewName("member/member-search");
			mav.addObject("count", cs.size());
			return mav;
		} else {
			return new ModelAndView("redirect:" + "/member-list");
		}
	}

	@RequestMapping("member-add")
	public void memberadd(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 接受json数据
		BufferedReader reader = request.getReader();
		String readerStr = "";// 接收用户端传来的JSON字符串
		String line;
		while ((line = reader.readLine()) != null) {
			readerStr = readerStr.concat(line);
		}

		@SuppressWarnings("rawtypes")
		HashMap map = JSONObject.parseObject(readerStr, HashMap.class);
		String username = (String) map.get("username");
		String sex = (String) map.get("sex");
		String phone = (String) map.get("phone");
		String email = (String) map.get("email");
		String address = (String) map.get("address");
		String password = (String) map.get("password");
		String state = (String) map.get("state");

		// 处理数据
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		Date curTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String date = sdf.format(curTime);
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setSex(sex);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setDate(date);
		user.setPassword(password);
		user.setState(state);

		// 返回json值
		String json = "";
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
		List<String> cs = userService.getByUsername(username);
		if (cs.isEmpty()) {
			try {
				userService.add(user);
				json = "{\"result\":\"success\"}";
				json = gson.toJson(json);
				out.write(json);
			} catch (Exception e) {
				json = "{\"result\":\"fail\"}";
				json = gson.toJson(json);
				out.write(json);
			}
		} else {
			json = "{\"result\":\"fail1\"}";
			json = gson.toJson(json);
			out.write(json);
		}
	}

	@RequestMapping("member-delete")
	public ModelAndView memberdel(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		userService.delete(id);
		return new ModelAndView("redirect:" + "/member-list");
	}

	@RequestMapping("member-getdata")
	public ModelAndView membergetdata(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String id = request.getParameter("id");
		List<User> cs = userService.getById(id);
		mav.addObject("cs", cs);
		mav.setViewName("member/member-edit");
		return mav;
	}

	@RequestMapping("member-edit")
	public void memberupdate(HttpServletRequest request, HttpServletResponse response) throws IOException {
		BufferedReader reader = request.getReader();
		String readerStr = "";// 接收用户端传来的JSON字符串
		String line;
		while ((line = reader.readLine()) != null) {
			readerStr = readerStr.concat(line);
		}

		@SuppressWarnings("rawtypes")
		HashMap map = JSONObject.parseObject(readerStr, HashMap.class);
		String id = (String) map.get("id");
		String username = (String) map.get("username");
		String sex = (String) map.get("sex");
		String phone = (String) map.get("phone");
		String email = (String) map.get("email");
		String address = (String) map.get("address");
		String password = (String) map.get("password");
		String state = (String) map.get("state");

		// 处理数据
		User user = new User();
		user.setId(id);
		user.setUsername(username);
		user.setSex(sex);
		user.setPhone(phone);
		user.setEmail(email);
		user.setAddress(address);
		user.setPassword(password);
		user.setState(state);

		// 返回json值
		String json = "";
		PrintWriter out = response.getWriter();
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.setStatus(HttpServletResponse.SC_OK);
		Gson gson = new GsonBuilder().disableHtmlEscaping().create();
			try {
				userService.update(user);
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
