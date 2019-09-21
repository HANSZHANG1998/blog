package com.how2java.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.how2java.mapper.UserMapper;
import com.how2java.pojo.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MybatisTest {
	


	@Autowired
	private UserMapper userMapper;

	@Test
	public void testuserList() {
		System.out.println(userMapper);
		List<User> aa= userMapper.list();
		for (User c : aa) {
			System.out.println(c.getUsername());
		}
	}
	
	

}
