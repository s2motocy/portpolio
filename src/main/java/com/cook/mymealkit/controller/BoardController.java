package com.cook.mymealkit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.BoardVO;
import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.domain.PageMakerDTO;
import com.cook.mymealkit.service.BoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {
	
	@Setter(onMethod_=@Autowired)
	private BoardService bservice;
	
	@GetMapping("/list")
	public void boardListGET(Model model, Criteria cri) {
		model.addAttribute("list", bservice.getListPaging(cri));
		int total = bservice.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
	}		
	    
    @GetMapping("/enroll")
    public void boardEnrollGET() { 
    }
    
    /* 문의 등록 */
    @PostMapping("/enroll")
    public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
    	bservice.enroll(board);
    	rttr.addFlashAttribute("result", "enroll success");
    	return "redirect:/board/list";
    }
    
    /* 문의 조회 */
    @GetMapping("/get")
    public void boardGetPageGET(int bno, Model model, Criteria cri) {
	    model.addAttribute("pageInfo", bservice.getPage(bno));
	    model.addAttribute("cri", cri);
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void boardModifyGET(int bno, Model model, Criteria cri) {
    	model.addAttribute("pageInfo", bservice.getPage(bno));  
    	model.addAttribute("cri", cri);
    }
    
    /* 문의 수정 */
    @PostMapping("/modify")
    public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {
    	System.out.println("dkanrjsl");
    	bservice.modify(board);
    	rttr.addFlashAttribute("result", "modify success");
    	return "redirect:/board/list";
    }
    
    /* 문의 삭제 */
    @PostMapping("/delete")
    public String boardDeletePOST(int bno, RedirectAttributes rttr) {
    	bservice.delete(bno);
    	rttr.addFlashAttribute("result", "delete success");
    	return "redirect:/board/list";
    }
}
