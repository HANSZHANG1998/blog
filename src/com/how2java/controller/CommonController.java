package com.how2java.controller;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.how2java.pojo.User;
import com.how2java.service.UserService;

@Controller
public class CommonController {
	
	@Autowired
	UserService userService;
	
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
	
	@RequestMapping("avatar")
	public void headImg(@RequestParam(value="file",required=false) MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		UUID uuid = UUID.randomUUID();
		String id = uuid.toString();
		String prefix="";
		User user = new User();
		HttpSession session = request.getSession();
		session.setAttribute("url", null);
		String username = (String)session.getAttribute("username");
        user.setUsername(username);
        String originalName = file.getOriginalFilename();
        prefix = originalName.substring(originalName.lastIndexOf(".")+1);
        String basePath = "C:\\Users\\Administrator\\Desktop\\blog\\WebContent\\images\\avatar\\"; //substituition
        String filepath = basePath + id + "." + prefix;
        String pathString = id + "." + prefix;
	    //保存上传
	     OutputStream out = null;
	    InputStream fileInput=null;

	    try{
	        if(file!=null){
	            filepath = filepath.replace("\\", "/");
	            File files=new File(filepath);
	            //打印查看上传路径

	            user.setUrl(pathString);
	            System.out.println(filepath);
	            if(!files.getParentFile().exists()){
	                files.getParentFile().mkdirs();
	            }
	            file.transferTo(files);
	        }
	        
	    }catch (Exception e){
	    }finally{
	        try {
	            if(out!=null){
	                out.close();
	            }
	            if(fileInput!=null){
	                fileInput.close();
	            }
	            
	            
	        } catch (IOException e) {
	        }
	    }
        try {
       	 String temp = userService.getUserByUsername(username).get(0).getUrl();
	            if(!temp.equals(null))
	            {
	            	File file2 = new File(basePath + temp);
		            file2.delete();
	            }
	           
       }catch(Exception e) {
       	
       }
       userService.updateurl(user);
       session.setAttribute("url", pathString);
       PrintWriter out1 = response.getWriter();
       out1.print("{\"code\":\"0\"}");
	  
	}
}