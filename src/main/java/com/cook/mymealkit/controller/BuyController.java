package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	UserService uservice;
	
	
	/* 회원 구매 로그인 */
	@GetMapping("/buyPageLogin")
	public void registerUser(BuyUserVO vo, HttpSession session, Model model) {
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
	public void register(UserVO uvo, BuyUserVO bvo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("bvo : "+bvo);
		
		System.out.println("POST , uvo : "+uvo + " , bvo"+bvo);
		UserVO vo = uservice.getUserById(uvo.getUser_id());
		System.out.println("vo: "+vo);
		/* User 정보 조회하여 실어보냄 */
		/* buy_no */
		String str="u"; // 문자열(u: user의 앞글자) 생성
		System.out.println("bno최대값 : "+bservice.getMaxBno());
		int bno = bservice.getMaxBno()+1; // bno 의 최대값+1
		for(int i=0;i<6-Integer.toString(bno).length();i++) { str += "0"; } // 6자리 숫자 생성위해 길이만큼을 뺀 나머지를 0으로 채움
		str += bno; // bno 를 넣음
		bvo.setBuy_no(str); // u + 00000 + 1   =  u000001
		bvo.setBuyer_name(vo.getUser_name());
		bvo.setPhone(vo.getPhone());
		bvo.setPost_code(vo.getPost_code());
		bvo.setAddr(vo.getAddr());
		bvo.setAddr2(vo.getAddr2());
		System.out.println("bvo : "+bvo);
		boolean success = uservice.login(uvo); // true
		if(success) {
		} else {
			session.setAttribute("id", uvo.getUser_id());
        	session.setAttribute("pwd", uvo.getPwd());
		}
	}
	
	// 회원 구매내역 조회
	@GetMapping("/mBuyGet")
	public void userBuy(Model model, HttpSession session, String user_id) {
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
	public String Buy(Model model) throws ParseException {
		List<BuyUserVO> buylist = bservice.userBuyList();
		System.out.println(buylist);
		model.addAttribute("buylist", buylist);
		System.out.println(buylist);
		return "/buy/buyList";
	} 
}
