package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.QuestionVO;
import com.cook.mymealkit.domain.Criteria;

public interface QuestionService {
    /* 문의 등록 */
    public void enroll(QuestionVO quest);

    /* 문의 목록 */
    public List<QuestionVO> getList();

    /* 문의 조회 */
    public QuestionVO getPage(int qno);

    /* 문의 수정 */
    public int modify(QuestionVO quest);

    /* 문의 삭제 */
    public int delete(int qno);

    /* 문의 목록(페이징 적용) */
    public List<QuestionVO> getListPaging(Criteria cri);

    /* 문의 총 갯수 */
    public int getTotal(Criteria cri);

    /* 문의 조회수 */
    public void increaseReadCount(int qno);

    /* 문의 답변 */
    public void insertReply(QuestionVO quest);

}
