package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.UserMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserTests {
	
	@Setter(onMethod_=@Autowired)
	private UserMapper umapper;
	
	@Test
	public void dummyInsert() {
		/* 회원 아이디 생성 */
		UserVO vo = new UserVO();
		vo.setUser_id("user");
		vo.setUser_name("회원");
		vo.setPwd("1234");
		vo.setEmail("test@test.com");
		vo.setPhone("010-0000-0000");
		vo.setPost_code("35410");
		vo.setAddr("서울시");
		vo.setAddr2("관악산쪽");
		umapper.insertUser(vo);
	}

}

