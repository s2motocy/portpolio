package com.cook.mymealkit.controller;

import static org.junit.Assert.assertEquals;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.CartDTO;
import com.cook.mymealkit.service.CartService;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartTests {
	
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	private CartService cservice;
	
	/* 하나 등록 */
	//@Test
	public void insertTest() {
		CartDTO dto = new CartDTO();
		dto.setUser_id("tester");
		dto.setItem_id(1L);
		dto.setItem_name("짜장");
		dto.setAmount(2);
		dto.setCart_price(20000);
		System.out.println(dto);
		cservice.cartInsert(dto);
	}
	
	
	
   @Test
    public void calculateDays() {
	   var s = ("2023-02-22").replace("-", ", ");
	   
        LocalDate date1 = LocalDate.of(2022, 9, 01);
        LocalDate date2 = LocalDate.of(2022, 8, 20);

        long diffDays = Math.abs(ChronoUnit.DAYS.between(date1, date2));

//	        assertEquals(2, diffDays);
        System.out.println("여기야"+diffDays);
    }
}
