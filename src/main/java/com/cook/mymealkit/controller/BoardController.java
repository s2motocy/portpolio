package com.cook.mymealkit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Setter;

@Controller
public class BoardController {
	@Setter(onMethod_=@Autowired) 
	private BoardServiceImpl service;
	@Setter(onMethod_=@Autowired)
	private BoardPage page;
	
	//방명록 목록 화면 요청================================================================
	@RequestMapping("/list.bo")
	public String list(HttpSession session, Model model, @RequestParam(defaultValue = "1") int curPage, String search, String keyword) {
		//DB에서 방명록 정보를 조회해와 목록 화면에 출력
		session.setAttribute("category", "bo");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		
		model.addAttribute("page", service.board_list(page));
		
		return "board/list";
	} //list()
} //class


