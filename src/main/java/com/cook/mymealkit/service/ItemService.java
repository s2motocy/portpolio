package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;

public interface ItemService {
	
	public void itemInsert(ItemVO vo);						// 등록
	public List<ItemVO> itemList();							// 목록
	public ItemVO itemFindById(long item_id);				// 조회
	public int itemUpdate(ItemVO vo);						// 수정
	public int itemDelete(long item_id);					// 삭제
	public List<AttachFileDTO> getAttachList(long item_id);	// 파일 정보
	public List<ItemVO> categoryItemList(String category);	// 카테고리 상품보기
	public void categoryByNewOrBest(ItemVO vo);				// 신상품/인기상품
	
}
