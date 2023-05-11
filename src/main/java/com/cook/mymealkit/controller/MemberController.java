package com.cook.mymealkit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cook.mymealkit.domain.MemberVO;
import com.cook.mymealkit.service.MemberService;

import lombok.Setter;

@Controller
@RequestMapping("/members/*")
public class MemberController {

	@Setter(onMethod_=@Autowired)
	MemberService memberservice;
	 //로그인 페이지 처리
	@GetMapping("login")
    public void login() {
    }
	
	@GetMapping("home")
    public String gohome() {
        return "members/home";
    }
    @PostMapping("login")
    public String login(MemberVO vo,Model model,HttpSession session) throws Exception {
    	boolean success = memberservice.login(vo);
        if(!success) {
        	session.setAttribute("id", vo.getId());
        	session.setAttribute("pwd", vo.getPwd());
            return "/members/login";
        }
        session.setAttribute("vo", memberservice.mypage(vo));
        return "redirect:/members/mypage";
    }
    //회원가입 처리
    @GetMapping("join")
    public void join() {
    	
    }
    @PostMapping("/join")
    public String signUP(MemberVO vo,Model model) throws Exception {
    	System.out.println(vo);
    	memberservice.join(vo);
    
    	return "redirect:/members/login";
    }
    //회원 수정 처리
    @GetMapping("/update")
    public String update(MemberVO vo,Model model,HttpSession session) {
    	MemberVO member= (MemberVO) session.getAttribute("vo");
		model.addAttribute("vo",member);
		return "/members/update";
    }
    @PostMapping("/update")
    public String update1(MemberVO vo,Model model,HttpSession session) {
		try {
			memberservice.updatemember(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/members/home";
    }
    //회원탈퇴 처리
    @GetMapping("/remove")
    public void remove() {
    	
    }
    @PostMapping("/remove")
    public String remove(MemberVO vo){
    	try {
    		memberservice.deletemember(vo);
    		return "/members/home";
    	}catch(Exception e) {
    		e.printStackTrace();
    		return "/members/remove";
    	}
    }
    //회원조회 처리
    @GetMapping("/memberlist")
    public String memberlist(Model model) {
    	List<MemberVO> members = memberservice.getAllMembers();
    	model.addAttribute("list1",members);
    	return "/members/memberlist";
    }
    //마이페이지
    @GetMapping("/mypage")
    public String mypage(Model model,HttpSession session) {
    	MemberVO member= (MemberVO) session.getAttribute("vo");
		model.addAttribute("vo",member);
    	return "/members/mypage";
    }
    //로그아웃처리
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        memberservice.logout(session);
        return "/members/home";
    }
}
