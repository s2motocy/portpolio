package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.ItemVO;

public interface ItemMapper {

	public void itemInsert(ItemVO vo);			// 등록
	public List<ItemVO> itemList();				// 목록
	public ItemVO itemFindById(long item_id);	// 조회
	public int itemUpdate(ItemVO vo);			// 수정
	public int itemDelete(long item_id);		// 삭제
	public Long getMax();						// item_id 가 0 일때 최대값(max) 찾기
	public int get_price(long item_id);			// price 값 찾기
	
}
