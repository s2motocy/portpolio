package com.cook.mymealkit.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.ChartVO;
import com.cook.mymealkit.mapper.AdminMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ChartTests {
	
	@Setter(onMethod_=@Autowired)
	private AdminMapper amapper;
	
	@Test
	public void memberIdChk() throws Exception{
		ChartVO vo = new ChartVO();
		vo.setStartDate("2023/05/12");
		vo.setEndDate("2023/05/18");
		System.out.println(amapper.getUserCountByRegDate(vo));
	}

}
