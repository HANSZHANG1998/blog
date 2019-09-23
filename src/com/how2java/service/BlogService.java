package com.how2java.service;

import java.util.List;
import com.how2java.pojo.Blog;

public interface BlogService {

	List<Blog> list();
	public void add(Blog blog);
	public void update(Blog blog);
	public void delete(String id);
	List<Blog> getById(String id);
	List<Blog> getByUsername(String id);
	List<Blog> getBlogByUsername(String id);
}
