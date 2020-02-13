package com.try1t.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.try1t.mapper.UserMapper;
import com.try1t.pojo.User;
import com.try1t.service.UserService;

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

	public void updatePasswordByUsername(User user) {
		userMapper.updatePasswordByUsername(user);
		
	}

}
