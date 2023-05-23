package com.cook.mymealkit.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.GuestVO;

@Mapper
public interface GuestMapper {
	
	public void insertGuest(GuestVO vo);
	
	public String getMaxEnvoice();
	
	public GuestVO gListByBuy_no(GuestVO guestvo); 
}
