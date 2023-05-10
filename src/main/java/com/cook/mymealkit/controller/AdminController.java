package com.cook.mymealkit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	/*관리자 메인 페이지로 이동*/
	@RequestMapping(value="/adminPage", method= RequestMethod.GET)
	public void admin() throws Exception{
		System.out.println("접속 성공");
	}
	
	/*상품 등록 페이지로 이동*/
	@RequestMapping(value="/item/register", method= RequestMethod.GET)
	public void register() throws Exception{
		System.out.println("상품 등록 페이지");
	}
	
	
}
