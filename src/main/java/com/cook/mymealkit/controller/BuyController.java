package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.BuyGuestVO;
import com.cook.mymealkit.domain.BuyListDTO;
import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.service.BuyService;
import com.cook.mymealkit.service.ItemService;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	@Setter(onMethod_=@Autowired)
	BuyService bservice;
	@Setter(onMethod_=@Autowired)
	UserService uservice;
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	
	
	/* 회원 구매 로그인 */
	@GetMapping("/buyPageLogin")
	public void registerUser(BuyUserVO bvo,BuyGuestVO gvo, HttpSession session, Model model) {
		System.out.println("vo : "+bvo);
		model.addAttribute("test", gvo);
		// 여기 페이지에서  login 관련만 화면에 보이게 하고 나머지는 hidden으로 감춘후 처리함
	}
	
	@PostMapping("buyPageLogin")
	public ResponseEntity<String> UserLoginPost(@RequestBody UserVO uvo, BuyUserVO bvo, BuyGuestVO gvo, HttpSession session) {
		System.out.println("uvo:"+uvo+" ,bvo:"+bvo+" ,gvo: "+gvo);
		if(uvo.getUser_id() ==null || uvo.getUser_id().isEmpty() || uvo.getPwd() == null || uvo.getPwd().isEmpty()) {
			// user_id 와 pwd 의 값이 없을때 1 을 반환
			return new ResponseEntity<>("1", HttpStatus.BAD_REQUEST);
		} else if(uservice.getUserById(uvo.getUser_id()) == null) {
			// DB 에 user_id 와 일치하는 데이터가 없을때 2 를 반환
			return new ResponseEntity<>("2", HttpStatus.BAD_REQUEST);
		} else {
			UserVO vo = uservice.getUserById(uvo.getUser_id());
			if(!uvo.getPwd().equals(vo.getPwd())) {
				// 조회한 데이터의 비밀번호와 입력한 비밀번호가 같지 않으면 3 을 반환
				return new ResponseEntity<>("3", HttpStatus.BAD_REQUEST);
			}
			// 정상 데이터 일때 로그인
			boolean success = uservice.login(vo);
			if(!success) {
				// 로그인에 실패하면 4 를 반환
				return new ResponseEntity<>("4", HttpStatus.BAD_REQUEST);
			}
			// 정상 로그인이 가능할때 0 을 반환
			return new ResponseEntity<>("0", HttpStatus.OK);
		}
	}
	// 등록 (회원 -> 로그인 session 으로 구매내역을 확인하고 결제 완료시 get 페이지 이동)
	//     (비회원 -> 구매정보 입력 후 결제 완료시 get 페이지 이동)
	
	/* 회원 구매 */
	@GetMapping("/buyPageUser")
	public void register(UserVO uvo, BuyUserVO bvo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("BuyPageUser 에서 uvo : "+uvo + " , bvo"+bvo);
		
		UserVO vo = uservice.getUserById(uvo.getUser_id());
		System.out.println("vo: "+vo);
		
		/* 회원정보 */
		String str="u"; // 문자열(u: user의 앞글자) 생성
		int bno = bservice.getMaxBno()+1; // bno 의 최대값+1
		for(int i=0;i<6-Integer.toString(bno).length();i++) { str += "0"; } // 6자리 숫자 생성위해 길이만큼을 뺀 나머지를 0으로 채움
		str += bno; // bno 를 넣음
		bvo.setBuy_no(str); // u + 00000 + 1   =  u000001
		bvo.setBuyer_name(vo.getUser_name());
		bvo.setPhone(vo.getPhone());
		bvo.setPost_code(vo.getPost_code());
		bvo.setAddr(vo.getAddr());
		bvo.setAddr2(vo.getAddr2());
		System.out.println("입력된 bvo : "+bvo);
		model.addAttribute("data", bvo);
		
		/* 상품정보 */
		
	}
	
	/* 비회원 구매 */
	@GetMapping("/buyPageGuest")
	public void guestRegister(BuyGuestVO gvo) {
		System.out.println("BuyPageGuest 에서 gvo : "+gvo);
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
