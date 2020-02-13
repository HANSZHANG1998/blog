package com.try1t.mapper;

import java.util.List;

import com.try1t.pojo.Comment;

public interface CommentMapper {
	 public int add(Comment comment);  
	 public void delete(String id); 
	 public List<Comment> list(String blogid);
}
