package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.NoticeVO;
import com.cook.mymealkit.service.NoticeService;

import lombok.Setter;

@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	NoticeService nservice;

	/* 게시글 목록 조회 |--------------------------------------------------- */
	@GetMapping("/list")
	public void list(Model model, NoticeVO vo) {
		List<NoticeVO> posts = nservice.getPostList();
		System.out.println("컨트롤러: " + posts);
		model.addAttribute("list1", posts);
	}

	/* 게시글 상세 조회 |--------------------------------------------------- */
	@GetMapping("/get")
	public void get(NoticeVO vo, Model model) {
		NoticeVO post = nservice.getPostById(vo);
		model.addAttribute("pageInfo", post);
	}

	/* 게시글 생성 처리 |--------------------------------------------------- */
	@GetMapping("/enroll")
	public void enroll() {}

	@PostMapping("/enroll")
	public String enroll(NoticeVO vo, RedirectAttributes rttr) {
		nservice.createPost(vo);
		return "redirect:/notice/list";
	}

	/* 게시글 수정 처리 |--------------------------------------------------- */
	@GetMapping("/modify")
	public void update(NoticeVO vo, Model model) {
		NoticeVO id = nservice.getPostById(vo);
		model.addAttribute("pageInfo", id);
	}

	@PostMapping("/modify")
	public String boardModifyPOST(NoticeVO vo) {
		nservice.updatePost(vo);
		return "redirect:/notice/list";
	}

	/* 게시글 삭제 처리 |--------------------------------------------------- */
	@PostMapping("/delete")
	public String delete(NoticeVO vo) {
		nservice.deletePost(vo);
		return "redirect:/notice/list";
	}

}
