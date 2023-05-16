package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BoardVO;
import com.cook.mymealkit.domain.Criteria;
import com.cook.mymealkit.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServicempl implements BoardService {

	@Setter(onMethod_=@Autowired)
	private BoardMapper bmapper;

	@Override
	public void enroll(BoardVO board) {
		bmapper.enroll(board);
	}

	@Override
	public List<BoardVO> getList() {
		return bmapper.getList();
	}

	@Override
	public BoardVO getPage(int bno) {
		return bmapper.getPage(bno);
	}

	@Override
	public int modify(BoardVO board) {
		return bmapper.modify(board);
	}

	@Override
	public int delete(int bno) {
		return bmapper.delete(bno);
	}

	@Override
	public List<BoardVO> getListPaging(Criteria cri) {
		return bmapper.getListPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return bmapper.getTotal(cri);
	}
 
}
