package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.service.BuyService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BuyTests {
	@Setter(onMethod_=@Autowired)
	private BuyService bservice;
	
	//@Test
	public void insertUserTest() {
		BuyUserVO vo = new BuyUserVO();
		vo.setBuy_no("u000001");
		vo.setUser_id("user01");
		vo.setBuyer_name("Buyer_name");
		vo.setPhone("010-0000-0000");
		vo.setPost_code("999-999");
		vo.setAddr("수원");
		vo.setAddr2("팔달");
		bservice.insertUserBuy(vo);
	}
	
	@Test
	public void sqlTest() {
		System.out.println(bservice.getMaxBno()+1);
	}
}
