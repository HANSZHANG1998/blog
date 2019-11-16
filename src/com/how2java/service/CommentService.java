package com.how2java.service;

import java.util.List;
import com.how2java.pojo.Comment;

public interface CommentService {

	 public int add(Comment comment);  
	 public void delete(String id); 
	 public List<Comment> list(String blogid);
	
}
