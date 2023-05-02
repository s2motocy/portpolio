package com.cook.mymealkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.vo.ItemVO;

import lombok.Setter;

@Service
public class ItemServicempl implements ItemService{

	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;

	@Override
	public int itemUpdate(ItemVO vo) {
		return imapper.itemUpdate(vo);
	}
	
	


}
