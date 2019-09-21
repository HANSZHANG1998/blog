package com.how2java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import com.how2java.service.TagService;

@Controller
public class TagsController {

	@Autowired
	TagService tagservice;
}
