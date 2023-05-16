package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.mapper.UserMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserTests {
	
	@Setter(onMethod_=@Autowired)
	private UserMapper umapper;
	
	@Test
	public void memberIdChk() throws Exception{
		String id = "test";	// 존재하는 아이디
		String id2 = "test123";	// 존재하지 않는 아이디
		umapper.idCheck(id);
		umapper.idCheck(id2);
	}

}
