package com.try1t.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.try1t.mapper.CommentMapper;
import com.try1t.pojo.Comment;
import com.try1t.service.CommentService;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	CommentMapper commentMapper;

	public int add(Comment comment) {
		commentMapper.add(comment);
		return 0;
	}

	public void delete(String id) {
	    commentMapper.delete(id);
	}

	public List<Comment> list(String blogid) {
		return commentMapper.list(blogid);
	}

}
