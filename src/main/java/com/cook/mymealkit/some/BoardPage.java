package com.cook.mymealkit.some;

import java.util.List;

import com.cook.mymealkit.domain.BoardVO;

public class BoardPage extends BoardVO{
	private List<BoardVO> list;
	
	public List<BoardVO> getList() {
		return list;
	}
	
	public void setList(List<BoardVO> list) {
		this.list = list;
	}
}

