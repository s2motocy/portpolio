package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.DeliveryVO;

public interface DeliveryMapper {
	
	public List<DeliveryVO> delist();
	
	public List<DeliveryVO> delistByMemberId(String member_id); //delivery에서 조회 
}
