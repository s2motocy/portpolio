package com.cook.mymealkit.controller;

import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	 
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	
	 //로그인 페이지 처리
	@GetMapping("login")
    public void login() {
    }
    @PostMapping("login")
    public String login(UserVO vo,Model model,HttpSession session) throws Exception {
    	boolean success = uservice.login(vo);
        if(!success) {
        	model.addAttribute("message","로그인에 실패하셨습니다");
        	session.setAttribute("user",vo);
            return "/user/login";
        }
        else {
            model.addAttribute("message", "로그인 성공하셨습니다");
            session.setAttribute("vo", uservice.mypage(vo));
            return "redirect:/";
        }
    }
    //회원가입 처리
    @GetMapping("join")
    public void join() {
    	
    }
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
			UserVO user= (UserVO) session.getAttribute("vo");
			model.addAttribute("vo",user);
		}catch(Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/user/mypage";
    }
    //회원탈퇴 처리
    @GetMapping("/remove")
    public void remove() {
    	
    }
    @PostMapping("/remove")
    public String remove(UserVO vo){
    	try {
    		uservice.deleteUser(vo);
    		return "redirect:/";
    	}catch(Exception e) {
    		e.printStackTrace();
    		return "/user/remove";
    	}
    }
    //회원조회 처리
    @GetMapping("/userlist")
    public String memberlist(Model model) {
    	List<UserVO> users = uservice.getAllUser();
    	model.addAttribute("list1",users);
    	return "/user/userlist";
    }
    //마이페이지
    @GetMapping("/mypage")
    public String mypage(Model model,HttpSession session) {
    	UserVO user= (UserVO) session.getAttribute("vo");
		model.addAttribute("vo",user);
    	return "/user/mypage";
    }
    //로그아웃처리
    @PostMapping("/logout")
    public String logout(HttpSession session) {
    	uservice.logout(session);
        return "redirect:/";
    }
    //아이디 중복조회
    @GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String user_id) {
    	System.out.println("여기는 컨트롤렁 :" +user_id);
		String email = uservice.idCheck(user_id);
		System.out.println(email);
		return new ResponseEntity<>(email, HttpStatus.OK);
	}
    //아이디 찾기
    @GetMapping("/findid")
    public String findIdView() {
		return "user/findid";
	}
    @PostMapping("/findid")
    public String findIdAction(UserVO vo, Model model) {
		UserVO user = uservice.findId(vo);
		System.out.println(user);
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUser_id());
		}
		return "user/findid";
	}
    //비밀번호 찾기
    @GetMapping("/findpwd")
    public String findPasswordView() {
		return "user/findpwd";
	}
    @PostMapping("/findpwd")
    public String findPasswordAction(UserVO vo, Model model) {
		UserVO user = uservice.findPassword(vo);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("user_id", user.getUser_id());
		}
		
		return "user/findpwd";
	}
 // 비밀번호 바꾸기 실행
    @GetMapping("update_password")
    public void updatePassword() {
    	
    }
 	@PostMapping("update_password")
 	public String updatePasswordAction(UserVO vo,Model model,String user_id2) {
 		System.out.println("컨트롤러 vo: "+vo);
 		vo.setUser_id(user_id2);
 		uservice.updatePassword(vo);
 		return "user/login";
 	}

 	//이메일 인증
    @GetMapping("/mailCheck")
    @ResponseBody
    public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		 /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        System.out.println("인증번호 " + checkNum);
        /* 이메일 보내기 */
        String setFrom = "sjinjin6@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		System.out.println("여기는 서비스 결과 왜 여기서 터지는가 " + content);
		try {
		            
		            MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(setFrom);
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		 String num = Integer.toString(checkNum);
		return num;
	}
    
}

