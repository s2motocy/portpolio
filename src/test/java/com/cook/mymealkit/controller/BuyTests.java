package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.BuyDTO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BuyTests {
	@Setter(onMethod_=@Autowired)
	private BuyMapper bmapper;
	
	@Test
	public void insertTest() {
		BuyDTO dto = new BuyDTO();
		dto.setBuy_no("t000001");
		dto.setBuyer_name("Buyer_name");
		dto.setPost_code("999-999");
		dto.setAddr("수원");
		dto.setAddr2("팔달");
		dto.setBuy("구매완료");
		
//		bmapper.insertMBuy(dto);
		bmapper.insertGuestBuy(dto);
	}
}
