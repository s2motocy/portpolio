package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.vo.ItemVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ItemTests {
	@Setter(onMethod_=@Autowired)
	private ItemMapper mapper;
	
	@Test
	public void insert_dummy_test() {
		for(int i=0;i<10;i++) {
			ItemVO vo = new ItemVO();
			vo.setCategory(null);
			vo.setName(null);
			vo.setPrice(0);
			vo.setDescription(null);
			vo.setUpdate_date(null);
			mapper.itemInsert(vo);
		}
	}
}
