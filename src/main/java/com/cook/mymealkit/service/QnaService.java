package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.QnaVO;
import com.cook.mymealkit.some.QnaPage;

public interface QnaService {
	void qna_insert(QnaVO vo); 		//글 저장
	List<QnaVO> qna_list();			//목록 조회
	QnaPage qna_list(QnaPage page);	//페이지 처리 된 공지글 목록 조회
	QnaVO qna_detail(int id);		//상세 조회
	void qna_update(QnaVO vo);		//글 수정
	void qna_delete(int id);		//글 삭제
	QnaVO qna_read(int id);			//조회수 증가 처리
	void qna_reply_insert(QnaVO vo);//답글 저장
}