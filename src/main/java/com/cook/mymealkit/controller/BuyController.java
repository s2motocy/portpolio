package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.BuyVO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	@Setter(onMethod_=@Autowired)
	BuyMapper bmapper;
	
	// 회원 구매내역 조회
	@GetMapping("/mBuyList")
	public void memberbuy(Model model, String member_id) throws ParseException {
		System.out.println("멤버아이디 잘못됬음?" + member_id);		
		List<BuyVO> mbList = bmapper.bListByMemberId(member_id);
		System.out.println(mbList);
		model.addAttribute("mblist", mbList);
		mbList.forEach(i -> {
			System.out.println(i);
		});
//		return "/buy/mBuyList";
	}

	// 관리자권한 전체 구매내역 조회
	@GetMapping("/buyList")
	public String buy(Model model) throws ParseException {
		List<BuyVO>buylist = bmapper.bList();
		System.out.println(buylist);
		model.addAttribute("buylist", buylist);
		System.out.println(buylist);
		return "/buy/buyList";
	}
	
}
