package com.how2java.service;

import java.util.List;
import com.how2java.pojo.User;

public interface UserService {

	List<User> list();
	public void add(User user);
	public void update(User user);
	public void delete(String id);
	public List<User> getById(String id);
	public List<String> getByUsername(String username);
	
}
