package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.GuestVO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.GuestMapper;
import com.cook.mymealkit.mapper.ItemMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class GuestTest {
	
	@Setter(onMethod_=@Autowired)
	GuestMapper gmapper;
	
	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;


	
	
//	@Test
	public void insertTest() {
		GuestVO vo = new GuestVO();
		vo.setGid(null);
		vo.setName("test");
		vo.setPnum("1234");
		vo.setPwd("1234");
		vo.setAddress("test");
		vo.setDeaddress("asdf");
		vo.setItemid(1L);
		int intValue = Integer.parseInt(gmapper.getMaxEnvoice().replaceAll("[^1-9]", ""))+1; // returns 123
//		System.out.println(intValue);
		System.out.println(Integer.toString(intValue).length());
		String str="g";
		for(int i =0;i<6- Integer.toString(intValue).length();i++) {
			str+="0";
		}
		str+=intValue;
		System.out.println(str);
		vo.setEnvoice_no(str);
//		vo.setEnvoice_no("g000331");

		gmapper.insertGuest(vo);
	}


	

}
