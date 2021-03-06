package com.try1t.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.try1t.mapper.BlogMapper;
import com.try1t.pojo.Blog;
import com.try1t.service.BlogService;

@Service
public class BlogServiceImpl implements BlogService{

	@Autowired
	BlogMapper blogMapper;
	
	public List<Blog> list(){
		return blogMapper.list();
	}

	public void add(Blog blog) {
		blogMapper.add(blog);
	}

	public void update(Blog blog) {
		blogMapper.update(blog);
	}

	public void delete(String id) {
		blogMapper.delete(id);
	}

	public List<Blog> getById(String id) {
		return blogMapper.getById(id);
	}

	public List<Blog> getByUsername(String username) {
		return blogMapper.getByUsername(username);
	}

	@Override
	public List<Blog> getBlogByUsername(String username) {
		return blogMapper.getBlogByUsername(username);
	}

	@Override
	public void updateViews(Blog blog) {
		 blogMapper.updateViews(blog);
	}

	@Override
	public List<Blog> searchlike(String content) {
        return blogMapper.searchlike(content);
	}

	@Override
	public List<Blog> getBlogByCategory(String category) {
		return blogMapper.getBlogByCategory(category);
	}

	
}
