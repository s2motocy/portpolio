package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.DeliveryVO;
import com.cook.mymealkit.mapper.DeliveryMapper;

import lombok.Setter;

@Controller
@RequestMapping("/delivery/*")
public class DeliveryController {
	
	@Setter(onMethod_=@Autowired)
	private DeliveryMapper dmapper;
	
	
	@GetMapping("/delist")
	public String delivery(Model model ,HttpSession session , String member_id) throws ParseException {
//		List<DeliveryVO>delist = dmapper.delist();
		System.out.println("멤버아이디 잘못됬음?" + member_id);
		
		List<DeliveryVO> list = dmapper.delistByMemberId(member_id);
		model.addAttribute("list", list);
		list.forEach(i -> {
			System.out.println(i);
		});
		// MemberVO loginedMember = (MemberVO)session.getAttribute("login");
		// model.addAttribute("login",log)
//		System.out.println(delist);
		return "/delivery/delist";
	}

// 관리자권한 구매목록 조회
//	@GetMapping("/delist")
//	public String delivery(Model model) throws ParseException {
//		List<DeliveryVO>delist = dmapper.delist();
//		model.addAttribute("list", delist);
//		System.out.println(delist);
//		return "/delivery/delist";
//	}
	
}
