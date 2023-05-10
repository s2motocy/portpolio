package com.cook.mymealkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BoardVO;
import com.cook.mymealkit.mapper.BoardMapper;
import com.cook.mymealkit.some.BoardPage;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardSerivce{
	@Setter(onMethod_=@Autowired)
	private BoardMapper bmapper;

	@Override
	public int board_insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardPage board_list(BoardPage page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardVO board_detail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void board_read(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int board_update(BoardVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int board_delete(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

}
