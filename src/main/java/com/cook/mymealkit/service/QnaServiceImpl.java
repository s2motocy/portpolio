package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.QnaVO;
import com.cook.mymealkit.mapper.QnaMapper;
import com.cook.mymealkit.some.QnaPage;

import lombok.Setter;

@Service
public class QnaServiceImpl implements QnaService{
	@Setter(onMethod_=@Autowired)
	private QnaMapper qmapper;

	@Override
	public void qna_insert(QnaVO vo) {
		qmapper.Qna_insert(vo);
	}

	@Override
	public List<QnaVO> qna_list() {
		return qmapper.Qna_list();
	}

	@Override
	public QnaVO qna_detail(int id) {
		return qmapper.Qna_detial(id);
	}

	@Override
	public void qna_update(QnaVO vo) {
		qmapper.Qna_update(vo);
	}

	@Override
	public void qna_delete(int id) {
		qmapper.Qna_delete(id);
	}

	@Override
	public QnaVO qna_read(int id){
		return qmapper.Qna_read(id);
	}

	@Override
	public void qna_reply_insert(QnaVO vo) {
		qmapper.Qna_insert(vo);
	}

	@Override
	public QnaPage qna_list(QnaPage page) {
		return qmapper.Qna_list(page);
	}

}


