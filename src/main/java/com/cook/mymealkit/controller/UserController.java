package com.cook.mymealkit.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	UserService uservice;
	/* 메일 전송 Java 라이브러리 설정 */
	@Setter(onMethod_=@Autowired)
	JavaMailSenderImpl mailSender;
	
	
	/* 회원가입 처리 |--------------------------------------------------- */
    @GetMapping("/join")
    public void join() {}
    
    @PostMapping("/join")
    public String signUP(UserVO vo,Model model){
    	System.out.println(vo);
    	uservice.join(vo);
    	return "redirect:/user/login";
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
	
    // 아이디 중복 확인 
    @PostMapping("/userIdCheck")
    @ResponseBody
	public String IdChkPOST(String user_id){
		int result = uservice.idCheck(user_id);
		System.out.println("결과값 = " + result);	
		if(result == 0) {	
			return "fail";
		} else {
			return "success";	
		}
	}
	
	/* 로그인 페이지 처리 |--------------------------------------------------- */
	@GetMapping("/login")
	public void login() {}

	@PostMapping("/login")
	public String login(UserVO vo, Model model, HttpSession session) {
		System.out.println("UserVO 에서 vo는 뭔가?: " + vo);
		boolean success = uservice.login(vo);
		UserVO user = uservice.getUserById(vo.getUser_id());
		System.out.println("관리자:"+user);
		System.out.println(success);
		if (!success) {
			session.setAttribute("user", vo);
			return "/user/login";
		}
		if(success) {
			session.setAttribute("vo", uservice.mypage(vo));
			
			try {
				if(user.getAuth().equals("a")) {
					 System.out.println(user);
					 session.setAttribute("admin", uservice.getUserById(vo.getUser_id()).getAuth());
				}
			} catch(Exception e) {
				System.out.println("예외:"+user);
			}
		}
		return "redirect:/main";
	}
	
	/* 아이디 찾기 |--------------------------------------------------- */
	@GetMapping("/findid")
	public void findIdView() {}

	@PostMapping("/findid")
	public String findIdAction(UserVO vo, Model model) {
		UserVO user = uservice.findId(vo);
		System.out.println(user);
		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("id", user.getUser_id());
		}
		return "redirect:/user/findid";
	}

	/* 비밀번호 찾기 |--------------------------------------------------- */
	@GetMapping("/findpwd")
	public void findPasswordView() {}

	@PostMapping("/findpwd")
	public String findPasswordAction(UserVO vo, Model model) {
		UserVO user = uservice.findPassword(vo);
		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("user_id", user.getUser_id());
		}
		return "redirect:/user/findpwd";
	}

	/* 비밀번호 바꾸기 실행 |--------------------------------------------------- */
    @GetMapping("/update_password")
    public void updatePassword() {}

	@PostMapping("/update_password")
	public String updatePasswordAction(UserVO vo, Model model, String user_id2) {
		System.out.println("컨트롤러 vo: " + vo);
		vo.setUser_id(user_id2);
		uservice.updatePassword(vo);
		return "redirect:/user/login";
	}
	
	/* 마이페이지 |--------------------------------------------------- */
	@GetMapping("/mypage")
	public void mypage(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("vo");
		System.out.println("마이페이지정보 :"+user);
		model.addAttribute("vo", user);
	}
	
	/* 회원 수정 처리 |--------------------------------------------------- */
    @GetMapping("/update")
    public void update(UserVO vo,Model model,HttpSession session) {
    	UserVO user= (UserVO) session.getAttribute("vo");
		model.addAttribute("vo",user);
	}

	@PostMapping("/update")
	public String updateUser(UserVO vo, Model model) {
		uservice.updateUser(vo);
		System.out.println("업데이트vo확잉이요!!!!!!!!!!!"+vo);
		return "/user/mypage";
	}

	/* 회원탈퇴 처리 |--------------------------------------------------- */
	@GetMapping("/remove")
	public void remove() {}

	@PostMapping("/remove")
	public String remove(UserVO vo, HttpSession session) {
		uservice.deleteUser(vo);
		session.invalidate();
		return "redirect:/";
	}

	/* 회원조회 처리 |--------------------------------------------------- */
	@GetMapping("/userlist")
	public void memberlist(Model model) {
		List<UserVO> users = uservice.getAllUser();
		model.addAttribute("list1", users);
	}

	/* 로그아웃처리 |--------------------------------------------------- */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		uservice.logout(session);
		return "redirect:/";
	}
	
	/* 삭제 |--------------------------------------------------- */
	@GetMapping("/delete")
	public String userDelete(long uno) {
		uservice.userDelete(uno);
		return "redirect:/user/userlist";
	}
}
