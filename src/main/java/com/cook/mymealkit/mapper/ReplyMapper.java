package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.domain.ReplyDTO;

public interface ReplyMapper {

	/* 댓글 등록 */
	public int enrollReply(ReplyDTO dto);

	/* 댓글 존재 체크 */
	public Integer checkReply(ReplyDTO dto);

	/* 댓글 페이징 */
	public List<ReplyDTO> getReplyList(Criteria cri);

	/* 댓글 총 갯수(페이징) */
	public long getReplyTotal(long item_id);

	/* 댓글 수정 */
	public int updateReply(ReplyDTO dto);

	/* 댓글 한개 정보(수정페이지) */
	public ReplyDTO getUpdateReply(int reply_id);

	/* 댓글 삭제 */
	public int deleteReply(int reply_id);
}
