package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.domain.SelectDTO;

public interface ItemMapper {

	public void itemInsert(ItemVO vo);								// 등록
	public List<ItemVO> itemList();									// 목록
	public ItemVO itemFindById(long item_id);						// 조회
	public int itemUpdate(ItemVO vo);								// 수정
	public int itemDelete(long item_id);							// 삭제
	public Long getMax();											// item_id 가 0 일때 최대값(max) 찾기
	public int get_price(long item_id);								// price 값 찾기
	public List<ItemVO> categoryByNewOrBest(ItemVO vo);				// 신상품/인기상품
	public List<ItemVO> categoryItemListByStartAndEnd(ItemVO vo);	// 가격설정	
	public List<ItemVO> categoryItemList(String category);			// 카테고리 상품보기
	

	public List<ItemVO> itemListBySearch(String search); 			// 검색
	public ItemVO getItemIdName(long item_id); 						// 상품 id 이름
	public List<SelectDTO> likeSelect(); 							// 평점순 상품

}
