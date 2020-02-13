package com.try1t.service;

import java.util.List;

import com.try1t.pojo.Blog;

public interface BlogService {

	List<Blog> list();
	public void add(Blog blog);
	public void update(Blog blog);
	public void delete(String id);
	List<Blog> getById(String id);
	List<Blog> getByUsername(String id);
	List<Blog> getBlogByUsername(String id);
	public void updateViews(Blog blog);
    public List<Blog> searchlike(String content);
    public List<Blog> getBlogByCategory(String category); 
}
