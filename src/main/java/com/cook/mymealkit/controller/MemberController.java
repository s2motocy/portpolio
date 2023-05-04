package com.cook.mymealkit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.MemberVO;
import com.cook.mymealkit.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Setter(onMethod_=@Autowired)
	MemberService memberservice;
	
	 // 회원 가입 처리
    @GetMapping("/join")
    public String signUp() {
    	return "member/join";
    }
    
    @PostMapping("/join")
    public String signUP(MemberVO vo, RedirectAttributes rttr) {
    	System.out.println("vo:"+vo);
    	memberservice.join(vo);
//    	rttr.addAttribute("join", vo);
    	return "redirect:/member/login";
    }
	
	//로그인 페이지 처리
	@GetMapping("/login")
	public String loginGet(){
		return "/member/login";
	}
	
	 //로그인 페이지 처리
	@PostMapping("/login")
    public String login(MemberVO vo,  Model model,HttpSession session) {
		System.out.println("로그인 컨트롤러 vo : " +vo);
		if(memberservice.getWithIdAndPassword(vo)!=null) {
			session.setAttribute("login", vo);
			model.addAttribute("member_id", vo.getId());
			return "/member/mypage";
		}else {
			return "error";
		}
    }
	
	@GetMapping("/mypage")
	public void mypage() {}; 
}
