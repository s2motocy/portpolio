package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;

public interface ItemMapper {

	public void itemInsert(ItemVO vo);			// 등록
	public List<ItemVO> itemList();				// 목록
	public ItemVO itemFindById(long itemid);	// 조회
	public int itemUpdate(ItemVO vo);			// 수정
	public int itemDelete(long itemid);			// 삭제
	public Long getMax();						// itemid 가 0 일때 max 값 찾기
	public ItemVO getByItemid(Long itemid);
}
