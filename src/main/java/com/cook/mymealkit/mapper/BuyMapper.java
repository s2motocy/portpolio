package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.BuyVO;

public interface BuyMapper {

	public List<BuyVO> bList();  // 전체 구매 내역
	
	public List<BuyVO> bListByMemberId(String member_id);  // 회원 구매 내역
}
