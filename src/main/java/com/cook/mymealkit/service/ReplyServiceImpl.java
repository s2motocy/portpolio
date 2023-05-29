package com.cook.mymealkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.domain.PageMakerDTO;
import com.cook.mymealkit.domain.ReplyDTO;
import com.cook.mymealkit.domain.ReplyPageDTO;
import com.cook.mymealkit.domain.UpdateReplyDTO;
import com.cook.mymealkit.mapper.ReplyMapper;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper rmapper;

	/* 댓글등록 */
	@Override
	public int enrollReply(ReplyDTO dto) {
		int result = rmapper.enrollReply(dto);
		return result;
	}

	@Override
	public String checkReply(ReplyDTO dto) {
		Integer result = rmapper.checkReply(dto);
		if (result == null) {
			return "0";
		} else {
			return "1";
		}
	}

	@Override
	public ReplyPageDTO replyList(Criteria cri) {
		ReplyPageDTO dto = new ReplyPageDTO();
		dto.setList(rmapper.getReplyList(cri));
		dto.setPageInfo(new PageMakerDTO(cri, rmapper.getReplyTotal(cri.getItem_id())));
		return dto;
	}

	@Override
	public int updateReply(ReplyDTO dto) {
		int result = rmapper.updateReply(dto);
		return result;
	}

	@Override
	public ReplyDTO getUpdateReply(int reply_id) {
		return rmapper.getUpdateReply(reply_id);
	}

	@Override
	public int deleteReply(ReplyDTO dto) {
		int result = rmapper.deleteReply(dto.getReply_id());
		return result;
	}
}
