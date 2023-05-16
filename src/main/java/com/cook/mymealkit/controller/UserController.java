package com.cook.mymealkit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Setter(onMethod_=@Autowired)
	UserService uservice;
	
	@GetMapping("/home")
	public void home() {}
	
	 //로그인 페이지 처리
	@GetMapping("/login")
    public void login() {}
	
    @PostMapping("/login")
    public String login(UserVO vo,Model model,HttpSession session) throws Exception {
    	boolean success = uservice.login(vo);
        if(!success) {
        	session.setAttribute("id", vo.getUser_id());
        	session.setAttribute("pwd", vo.getPwd());
            return "/user/login";
        }
        session.setAttribute("vo", uservice.mypage(vo));
        return "redirect:/users/mypage";
    }
    
    //회원가입 처리
    @GetMapping("join")
    public void join() {}
    
    @PostMapping("/join")
    public String signUP(UserVO vo,Model model) throws Exception {
    	System.out.println(vo);
    	uservice.join(vo);
    	return "redirect:/user/login";
    }
    //회원 수정 처리
    @GetMapping("/update")
    public String update(UserVO vo,Model model,HttpSession session) {
    	UserVO user= (UserVO) session.getAttribute("vo");
		model.addAttribute("vo",user);
		return "/user/update";
    }
    @PostMapping("/update")
    public String update1(UserVO vo,Model model,HttpSession session) {
		try {
			uservice.updateUser(vo);
		}catch(Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/user/home";
    }
    
    //회원탈퇴 처리
    @GetMapping("/remove")
    public void remove() {
    	
    }
    @PostMapping("/remove")
    public String remove(UserVO vo){
    	try {
    		uservice.deleteUser(vo);
    		return "/user/home";
    	}catch(Exception e) {
    		e.printStackTrace();
    		return "/user/remove";
    	}
    }
    
    //회원조회 처리
    @GetMapping("/userList")
    public String userList(Model model) {
    	List<UserVO> users = uservice.getAllUsers();
    	model.addAttribute("list1", users);
    	return "/members/memberlist";
    }
    
    //마이페이지
    @GetMapping("/mypage")
    public String mypage(Model model,HttpSession session) {
    	UserVO user= (UserVO) session.getAttribute("vo");
		model.addAttribute("vo", user);
    	return "/members/mypage";
    }
    
    //로그아웃처리
    @PostMapping("/logout")
    public String logout(HttpSession session) {
    	uservice.logout(session);
        return "redirect:/item/itemList";
    }
}
