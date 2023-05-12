package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.BuyDTO;

@Mapper
public interface BuyMapper {

	public void insertMBuy(BuyDTO dto); 			// 멤버 등록
	public void insertGuestBuy(BuyDTO dto); 				// 게스트 등록
	
	public List<BuyDTO> bList();  // 전체 구매 내역
	
	public List<BuyDTO> bListByMemberId(String member_id);  // 회원 구매 내역
	
}
