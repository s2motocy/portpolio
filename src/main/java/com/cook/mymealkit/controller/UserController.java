package com.cook.mymealkit.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;


@Controller
@RequestMapping("/user/*")
public class UserController {

	@Setter(onMethod_=@Autowired)
	UserService uservice;
	
	
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
        return "redirect:/";
    }
    
    //회원가입 처리
    @GetMapping("join")
    public void join() {}
    
    @PostMapping("/join")
    public String signUP(UserVO vo,Model model) throws Exception {
    	System.out.println(vo);
    	uservice.join(vo);
    	return "redirect:/index";
    }

  //아이디 중복조회
    @GetMapping("/idCheck")
	public ResponseEntity<Integer> idCheck(String user_id) {
    	System.out.println("여기는 컨트롤렁 :" +user_id);
		int res = uservice.idCheck(user_id);
		System.out.println(res);
		return new ResponseEntity<Integer>(res, HttpStatus.OK);
	}
    
    /* 이메일 인증 */
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheckGET(String email){
		
		/* 뷰(View)로부터 넘어온 데이터 확인 */
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("이메일 : " + email);
				
		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 " + checkNum);
		
		String num = Integer.toString(checkNum);
		
		return num;
		
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
    	return "redirect:/user/maypage";
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
    public void userList(Model model) {
    	List<UserVO> users = uservice.getAllUsers();
    	model.addAttribute("list1", users);
    }
    //마이페이지
    @GetMapping("/mypage")
    public String mypage(Model model,HttpSession session) {
    	UserVO user= (UserVO) session.getAttribute("vo");
		model.addAttribute("vo", user);
    	return "/user/mypage";
    }
    
    //로그아웃처리
    @PostMapping("/logout")
    public String logout(HttpSession session) {
    	uservice.logout(session);
        return "redirect:/item/itemList";
    }
}
