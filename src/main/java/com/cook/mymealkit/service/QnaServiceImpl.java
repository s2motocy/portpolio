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
	private QnaMapper dao;

	@Override
	public void Qna_insert(QnaVO vo) {
		dao.Qna_insert(vo);
		
	}

	@Override
	public List<QnaVO> Qna_list() {
		return dao.Qna_list();
	}


	@Override
	public void Qna_delete(int id) {
		dao.Qna_delete(id);
		
	}

	@Override
	public QnaPage Qna_list(QnaPage page) {
		return dao.Qna_list(page);
	}

	@Override
	public QnaVO Qna_detial(int id) {
		return dao.Qna_detial(id);
	}

	@Override
	public void Qna_update(QnaVO vo) {
	dao.Qna_update(vo);
		
	}

	@Override
	public QnaVO Qna_read(int id) {
		return dao.Qna_read(id);
	}



}
