package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.QuestionVO;
import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.mapper.QuestionMapper;

import lombok.Setter;

@Service
public class QuestionServicempl implements QuestionService {

	@Setter(onMethod_=@Autowired)
	private QuestionMapper qmapper;

	@Override
	public void enroll(QuestionVO quest) {
		qmapper.enroll(quest);
	}

	@Override
	public List<QuestionVO> getList() {
		return qmapper.getList();
	}

	@Override
	public QuestionVO getPage(int qno) {
		return qmapper.getPage(qno);
	}

	@Override
	public int modify(QuestionVO quest) {
		return qmapper.modify(quest);
	}

	@Override
	public int delete(int qno) {
		return qmapper.delete(qno);
	}

	@Override
	public List<QuestionVO> getListPaging(Criteria cri) {
		return qmapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return qmapper.getTotal(cri);
	}
 
}
