package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.CartMapper;
import com.cook.mymealkit.mapper.ItemMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ItemTests {
	
	@Setter(onMethod_=@Autowired)
	private ItemMapper imapper;
	
	@Setter(onMethod_=@Autowired)
	private CartMapper cmapper;
	
//	@Test
	public void insert_dummy_test() {
		for(int i=0;i<10;i++) {
			ItemVO vo = new ItemVO();
			vo.setCategory(null);
			vo.setName(null);
			vo.setPrice(0);
			vo.setDescription(null);
			vo.setUpdate_date(null);
			imapper.itemInsert(vo);
		}
	}
	
//	@Test
	public void service_test() {
		long itemid = 1;
		ItemVO vo = imapper.itemFindById(itemid);
		System.out.println("===================");
		System.out.println(vo);
		System.out.println("===================");
	}
	
	@Test
	public void updateTest() {
		ItemVO vo = new ItemVO();
		vo.setItemid(6L);
		vo.setCategory("양식");
		vo.setName("제발 나와라이요");
		vo.setPrice(300000);
		vo.setDescription("tlqklskldfbnsdfhiofga");
		imapper.itemUpdate(vo);
	}

}
