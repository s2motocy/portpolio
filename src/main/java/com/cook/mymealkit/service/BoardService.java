package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.BoardVO;
import com.cook.mymealkit.domain.Criteria;

public interface BoardService {
	/* 문의 등록 */
    public void enroll(BoardVO board);
    
    /* 문의 목록 */
    public List<BoardVO> getList();
    
    /* 문의 조회 */
    public BoardVO getPage(int bno);
    
    /* 문의 수정 */
    public int modify(BoardVO board);
    
    /* 문의 삭제 */
    public int delete(int bno);
    
    /* 문의 목록(페이징 적용) */
    public List<BoardVO> getListPaging(Criteria cri);
    
    /* 문의 총 갯수 */
    public int getTotal(Criteria cri);
}
