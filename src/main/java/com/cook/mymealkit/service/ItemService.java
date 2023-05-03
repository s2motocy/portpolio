package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;

public interface ItemService {
	
	public void itemInsert(ItemVO vo);						// 등록
	public List<ItemVO> itemList();							// 목록
	public ItemVO itemFindById(long itemid);				// 조회
	public int itemUpdate(ItemVO vo);						// 수정
	public int itemDelete(long itemid);						// 삭제
	public List<AttachFileDTO> getAttachList(long itemid);	// 파일 정보
	
}
