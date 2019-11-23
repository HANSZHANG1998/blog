package com.how2java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.how2java.mapper.UserMapper;
import com.how2java.pojo.User;
import com.how2java.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	
	public List<User> list(){
		return userMapper.list();
	};
    
	public void delete(String id) {
		userMapper.delete(id);
	}

	public void add(User user) {
	    userMapper.add(user);
		
	}

	public List<User> getById(String id) {
		return userMapper.getById(id);
	}

	public void update(User user) {
		 userMapper.update(user);
	}

	public List<String> getByUsername(String username) {
		return userMapper.getByUsername(username);
	}

	public void updateurl(User user) {
		userMapper.updateURL(user);		
	}

	public List<User> getUserByUsername(String username) {
	     return userMapper.getUserByUsername(username);
	}

	public void updateDetail(User user) {
		userMapper.updateDetail(user);
	}

}
