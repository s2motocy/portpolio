package com.cook.mymealkit.controller;

import java.util.List;

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
import com.cook.mymealkit.service.MailSendService;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/user/*")
public class UserController {

	@Setter(onMethod_ = @Autowired)
	UserService uservice;

	@Autowired
	private MailSendService mailService;

	// 로그인 페이지 처리
	@GetMapping("login")
	public void login() {
	}

	@PostMapping("login")
	public String login(UserVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("UserVO 에서 vo는 뭔가?: " + vo);
		boolean success = uservice.login(vo);
		UserVO user = uservice.getUserById(vo.getUser_id());
		System.out.println("관리자:"+user);
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
		
		//System.out.println(user);
		return "redirect:/";
	}

	// 회원가입 처리
	@GetMapping("join")
	public void join() {

	}

	@PostMapping("/join")
	public String signUP(UserVO vo, Model model) throws Exception {
		System.out.println(vo);
		uservice.join(vo);
		return "redirect:/user/login";
	}

	// 회원 수정 처리
	@GetMapping("/update")
	public String update(UserVO vo, Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("vo");
		model.addAttribute("vo", user);
		return "/user/update";
	}

	@PostMapping("/update")
	public String update1(UserVO vo, Model model, HttpSession session) {
		try {
			uservice.updateUser(vo);
			UserVO user = (UserVO) session.getAttribute("vo");
			model.addAttribute("vo", user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/user/mypage";
	}

	// 회원탈퇴 처리
	@GetMapping("/remove")
	public void remove() {

	}

	@PostMapping("/remove")
	public String remove(UserVO vo) {
		try {
			uservice.deleteUser(vo);
			return "redirect:/";
		} catch (Exception e) {
			e.printStackTrace();
			return "/user/remove";
		}
	}

	// 회원조회 처리
	@GetMapping("/userlist")
	public String memberlist(Model model) {
		List<UserVO> users = uservice.getAllUser();
		model.addAttribute("list1", users);
		return "/user/userlist";
	}

	// 마이페이지
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) {
		UserVO user = (UserVO) session.getAttribute("vo");
		model.addAttribute("vo", user);
		return "/user/mypage";
	}

	// 로그아웃처리
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		uservice.logout(session);
		return "redirect:/";
	}

	// 아이디 중복조회
	@GetMapping("/idCheck")
	public ResponseEntity<String> idCheck(String user_id) {
		System.out.println("여기는 컨트롤렁 :" + user_id);
		String email = uservice.idCheck(user_id);
		System.out.println(email);
		return new ResponseEntity<>(email, HttpStatus.OK);
	}

	// 아이디 찾기
	@GetMapping("/findid")
	public String findIdView() {
		return "user/findid";
	}

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
		return "user/findid";
	}

	// 비밀번호 찾기
	@GetMapping("/findpwd")
	public String findPasswordView() {
		return "user/findpwd";
	}

	@PostMapping("/findpwd")
	public String findPasswordAction(UserVO vo, Model model) {
		UserVO user = uservice.findPassword(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("user_id", user.getUser_id());
		}

		return "user/findpwd";
	}

	// 비밀번호 바꾸기 실행
	@PostMapping("update_password")
	public String updatePasswordAction(UserVO vo, Model model, String user_id2) {
		System.out.println("컨트롤러 vo: " + vo);
		vo.setUser_id(user_id2);
		uservice.updatePassword(vo);
		return "redirect:/user/login";
	}

	// 이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}

}
