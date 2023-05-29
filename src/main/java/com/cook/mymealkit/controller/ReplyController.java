package com.cook.mymealkit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.domain.ReplyDTO;
import com.cook.mymealkit.domain.ReplyPageDTO;
import com.cook.mymealkit.service.ReplyService;

import lombok.Setter;

@RestController
@RequestMapping("/reply")
public class ReplyController {

	@Setter(onMethod_ = @Autowired)
	private ReplyService rservice;

	/* 댓글 등록 */
	@PostMapping("/enroll")
	public void enrollReplyPOST(ReplyDTO dto) {
		rservice.enrollReply(dto);
	}

	/* 댓글 체크 */
	@PostMapping("/check")
	public String replyCheckPOST(ReplyDTO dto) {
		return rservice.checkReply(dto);
	}

	/* 댓글 페이징 */
	@GetMapping(value = "/list", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ReplyPageDTO replyListPOST(Criteria cri) {
		return rservice.replyList(cri);
	}

	/* 댓글 수정 */
	@PostMapping("/update")
	public void replyModifyPOST(ReplyDTO dto) {
		rservice.updateReply(dto);
	}

	/* 댓글 삭제 */
	@PostMapping("/delete")
	public void replyDeletePOST(ReplyDTO dto) {
		rservice.deleteReply(dto);
	}
}
