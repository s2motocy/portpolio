package com.cook.mymealkit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.CartDTO;
import com.cook.mymealkit.service.CartService;

import lombok.Setter;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	@Setter(onMethod_=@Autowired)
	private CartService cservice;
	
	@PostMapping("/register")
	public void cartInsert(CartDTO dto) {
		System.out.println("여기들어오나?"+dto);
	}
	
	@GetMapping("/cartList")
	public void cartList(CartDTO dto, Model model) {
		System.out.println("cart 컨트롤러에서 목록 : dto="+ dto);
		model.addAttribute("dto", dto);
	}
	
}
