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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.domain.PageMakerDTO;
import com.cook.mymealkit.domain.QuestionVO;
import com.cook.mymealkit.service.QuestionService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/question/*")
@Log4j
public class QuestionController {
	
	@Setter(onMethod_=@Autowired)
	private QuestionService qservice;
	
	@GetMapping("/list")
	public void questionListGET(HttpSession session, Model model, Criteria cri) {
		System.out.println(cri);
		List<QuestionVO> list = qservice.getListPaging(cri);
		System.out.println(list);
		model.addAttribute("list", list);
		int total = qservice.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker",pageMake);
	}	
	

	    
    @GetMapping("/enroll")
    public void questionEnrollGET() { 
    }
    
    /* 문의 등록 */
    @PostMapping("/enroll")
    public String questEnrollPOST(QuestionVO quest, RedirectAttributes rttr) {
    	qservice.enroll(quest);
    	rttr.addFlashAttribute("result", "enroll success");
    	return "redirect:/question/list";
    }
    
    /* 문의 조회 */
    @GetMapping("/get")
    public void questGetPageGET(HttpSession session, int qno, Model model, Criteria cri) {
    	qservice.increaseReadCount(qno);
	    model.addAttribute("pageInfo", qservice.getPage(qno));
	    model.addAttribute("cri", cri);
    }
    
    /* 수정 페이지 이동 */
    @GetMapping("/modify")
    public void questModifyGET(HttpSession session, int qno, Model model, Criteria cri) {
    	model.addAttribute("pageInfo", qservice.getPage(qno));  
    	model.addAttribute("cri", cri);
    }
    
    /* 문의 수정 */	
    @PostMapping("/modify")
    public String questModifyPOST(QuestionVO quest, RedirectAttributes rttr) {
    	qservice.modify(quest);
    	rttr.addFlashAttribute("result", "modify success");
    	return "redirect:/question/list";
    }
    
    /* 문의 삭제 */
    @PostMapping("/delete")
    public String questDeletePOST(int qno, RedirectAttributes rttr) {
    	qservice.delete(qno);
    	rttr.addFlashAttribute("result", "delete success");
    	return "redirect:/question/list";
    }
    
    @RequestMapping(value = "/checkPw", method = RequestMethod.POST)
    @ResponseBody
	public String IdChkPOST(QuestionVO vo){
		System.out.println("잘 넘어오는지 확인" + vo);
		QuestionVO quest = qservice.getPage(vo.getQno());
		System.out.println(quest);
		if (quest.getPassword().equals(vo.getPassword())) return "1";
		else return "0";
	} 
    @GetMapping("/reply")
    public void questReplyGET() {
    	
    }
    @PostMapping("/reply")
    public ResponseEntity<String> questReplyPOST(@RequestBody QuestionVO quest) {
    	System.out.println("vo:" +quest);
    	qservice.insertReply(quest);
    	return new ResponseEntity<String>("success",HttpStatus.OK);
    }
}
