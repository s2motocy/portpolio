package com.cook.mymealkit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.GuestVO;
import com.cook.mymealkit.mapper.GuestMapper;
import com.cook.mymealkit.service.GuestService;

import lombok.Setter;

@Controller
@RequestMapping("/guest/*")
public class GuestController {
	
	@Setter(onMethod_=@Autowired)
	GuestMapper gmapper;
	
	@Setter(onMethod_=@Autowired)
	GuestService gservice;
	
	
	@GetMapping("/guestOrder")
	public void guest() {};
	
	
	@PostMapping("/guestOrder")
	public String insertGuest(GuestVO vo){
		int intValue = Integer.parseInt(gmapper.getMaxEnvoice().replaceAll("[^1-9]", ""))+1; // returns 123
		System.out.println(Integer.toString(intValue).length());
		String str="g";
		for(int i =0;i<6- Integer.toString(intValue).length();i++) {
			str+="0";
		}
		str+=intValue;
		System.out.println(str);
		vo.setEnvoice_no(str);

		gservice.insertGuest(vo);
		return "error";
	}
	
	@GetMapping("/orderInquiry")
	public void order() {};
	
	@PostMapping("/orderInquiry")
	public String orderInquiry(GuestVO vo , Model model) {
		GuestVO guestVO = gservice.gListByEnvoice(vo);
		System.out.println(guestVO);
		model.addAttribute("vo" ,guestVO);
		return "guest/guestDetail";
	};
}

