package com.cook.mymealkit.mapper;

import java.util.List;
import com.cook.mymealkit.vo.ItemVO;

public interface ItemMapper {

	public void itemInsert(ItemVO vo);
	
	public List<ItemVO> itemList();
	
	public int itemUpdate(ItemVO vo);
	
	
}
