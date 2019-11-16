package com.how2java.mapper;

import java.util.List;

import com.how2java.pojo.Comment;

public interface CommentMapper {
	 public int add(Comment comment);  
	 public void delete(String id); 
	 public List<Comment> list(String blogid);
}
