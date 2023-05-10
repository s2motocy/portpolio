package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.QnaVO;
import com.cook.mymealkit.some.QnaPage;


public interface QnaMapper {
	public void Qna_insert(QnaVO vo);
	public List<QnaVO> Qna_list();
	public QnaPage Qna_list(QnaPage page);
	public QnaVO Qna_detial(int id);
	void Qna_update(QnaVO vo);
	public void Qna_delete(int id);
	QnaVO Qna_read(int id);

}