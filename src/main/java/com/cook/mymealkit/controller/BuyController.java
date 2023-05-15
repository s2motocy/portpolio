package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.BuyGuestVO;
import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.service.BuyService;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	@Setter(onMethod_=@Autowired)
	BuyService bservice;
	@Setter(onMethod_=@Autowired)
	UserService mservice;
	
	
	
	/* 회원 구매 로그인 */
	@GetMapping("/buyPageLogin")
	public void registerUser(BuyUserVO vo, HttpSession session,Model model) {
		System.out.println("vo : "+vo);
		model.addAttribute("test", vo);
		// 여기 페이지에서  login 관련만 화면에 보이게 하고 나머지는 hidden으로 감춘후 처리함 
	}
	
	/* 게스트 구매 로그인 */
	@GetMapping("/buyPageGuest")
	public void registerGuest(BuyGuestVO vo, HttpSession session, Model model) {
		System.out.println("vo : "+vo);
		model.addAttribute("test", vo);
	}
	
	
	// 등록 (회원 -> 로그인 session 으로 구매내역을 확인하고 결제 완료시 get 페이지 이동)
	//     (비회원 -> 구매정보 입력 후 결제 완료시 get 페이지 이동)
	
	/* 회원 구매 */
	@GetMapping("/buyPage")
	public void register(BuyUserVO vo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("vo : "+vo);
		UserVO uvo = (UserVO)session.getAttribute("id");
		// user_id, item_id, item_name, amount
//		mservice.mypage(uvo);
		model.addAttribute("test", uvo);
		

	}
	
	
	// 회원 구매내역 조회
	@GetMapping("/mBuyGet")
	public void memberbuy(Model model, HttpSession session, String user_id) {
		System.out.println("멤버아이디 잘못됬음?" + user_id);		
		List<BuyUserVO> mbList = bservice.bListByUserId(user_id);
		System.out.println(mbList);
		model.addAttribute("mblist", mbList);
		mbList.forEach(i -> {
			System.out.println(i);
		});
	}

	// 관리자권한 전체 구매내역 조회
	@GetMapping("/buyList")
	public String buy(Model model) throws ParseException {
		List<BuyUserVO> buylist = bservice.userBuyList();
		System.out.println(buylist);
		model.addAttribute("buylist", buylist);
		System.out.println(buylist);
		return "/buy/buyList";
	} 
	
}
