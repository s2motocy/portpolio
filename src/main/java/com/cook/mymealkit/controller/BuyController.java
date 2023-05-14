package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	@Setter(onMethod_=@Autowired)
	BuyMapper bmapper;
	
	// 등록 (회원 -> 로그인 session 으로 구매내역을 확인하고 결제 완료시 get 페이지 이동)
	//     (비회원 -> 구매정보 입력 후 결제 완료시 get 페이지 이동)
	
	/* 회원 구매 */
	@GetMapping("/buyPage")
	public void register(BuyUserVO vo) {
		System.out.println("vo : "+vo);
		List<BuyUserVO> uvo = bmapper.bListByUserId(vo.getUser_id());
		
	}
	
	
	// 회원 구매내역 조회
	@GetMapping("/mBuyGet")
	public void memberbuy(Model model, HttpSession session, String user_id) throws ParseException {
		System.out.println("멤버아이디 잘못됬음?" + user_id);		
		List<BuyUserVO> mbList = bmapper.bListByUserId(user_id);
		System.out.println(mbList);
		model.addAttribute("mblist", mbList);
		mbList.forEach(i -> {
			System.out.println(i);
		});
	}

	// 관리자권한 전체 구매내역 조회
	@GetMapping("/buyList")
	public String buy(Model model) throws ParseException {
		List<BuyUserVO> buylist = bmapper.userBuyList();
		System.out.println(buylist);
		model.addAttribute("buylist", buylist);
		System.out.println(buylist);
		return "/buy/buyList";
	} 
	
}
