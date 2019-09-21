package com.how2java.service;

import java.util.List;
import com.how2java.pojo.Tag;

public interface TagService {

	List<Tag> list();
	public void add(Tag tag);
	
}
