package com.try1t.service;

import java.util.List;

import com.try1t.pojo.Comment;

public interface CommentService {

	 public int add(Comment comment);  
	 public void delete(String id); 
	 public List<Comment> list(String blogid);
	
}
