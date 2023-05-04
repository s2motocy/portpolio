package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.InquiryVO;
import com.cook.mymealkit.mapper.InquiryMapper;

import lombok.Setter;

@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {
	
	@Setter(onMethod_=@Autowired)
	private InquiryMapper qmapper;

	@GetMapping("/quest")
	public void tbl_inquiry(Model model) {
		List<InquiryVO>quest = qmapper.quest();
		model.addAttribute("list", quest);
	}
}
