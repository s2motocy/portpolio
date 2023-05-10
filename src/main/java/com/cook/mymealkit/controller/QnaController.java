package com.cook.mymealkit.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cook.mymealkit.domain.QnaVO;
import com.cook.mymealkit.service.MemberServiceImpl;
import com.cook.mymealkit.service.QnaServiceImpl;
import com.cook.mymealkit.some.QnaPage;

import lombok.Setter;
@RequestMapping("/Qna/*")
@Controller
public class QnaController {
	@Setter(onMethod_=@Autowired)
	private QnaServiceImpl service;
	
	@Setter(onMethod_=@Autowired)
	private MemberServiceImpl member;
	
	@Setter(onMethod_=@Autowired)
	private QnaPage page;
	
	@GetMapping("/list")
	public String list(Model model, HttpSession session, @RequestParam(defaultValue="1") int curPage, String search, String keyword) {
		HashMap<String, String>map = new HashMap<String, String>();
		map.put("id","admin");
		map.put("pw", "1234");
		session	.setAttribute("category", "Qna");
		page.setCurPage(curPage);
		page.setSearch(search);
		page.setKeyword(keyword);
		model.addAttribute("page",service.Qna_list());
		return "Qna/list";
	}
	@GetMapping("/new")
	public String Qna() {
		return "Qna/new";
	}
	@PostMapping("/new")
	public String insertData(QnaVO qnavo) {
		
		System.out.println(qnavo);
		
		service.Qna_insert(qnavo);
		
	    return "redirect:/Qna/list";
	}
	@GetMapping("/detail")
	public String detail(int id ,Model model) {
		System.out.println(id);
		QnaVO data = service.Qna_read(id);
		System.out.println(data);
		model.addAttribute("list",data);
		return "Qna/detail";
	}
	
}