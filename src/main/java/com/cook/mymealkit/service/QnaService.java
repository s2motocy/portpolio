package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.QnaVO;
import com.cook.mymealkit.some.QnaPage;

public interface QnaService {
	public void Qna_insert(QnaVO vo);
	public List<QnaVO> Qna_list();
	public QnaPage Qna_list(QnaPage page);
	public QnaVO Qna_detial(int id);
	void Qna_update(QnaVO vo);
	public void Qna_delete(int id);
	QnaVO Qna_read(int id);


}
