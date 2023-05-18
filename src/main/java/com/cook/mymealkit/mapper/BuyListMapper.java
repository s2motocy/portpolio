package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.BuyListDTO;

@Mapper
public interface BuyListMapper {
	
	public void register(BuyListDTO dto);
	public List<BuyListDTO> buy_lists();
	public List<BuyListDTO> listOfNo(String buy_no);
	
}
