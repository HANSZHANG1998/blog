package com.how2java.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.how2java.mapper.TagMapper;
import com.how2java.pojo.Tag;
import com.how2java.service.TagService;

@Service
public class TagServiceImpl implements TagService{

	@Autowired
	TagMapper tagMapper;
	
	public List<Tag> list() {
		return tagMapper.list();
	}

	public void add(Tag tag) {
		tagMapper.add(tag);
	}

}
