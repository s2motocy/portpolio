package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.BuyDTO;


public interface BuyService {

	public void insertMBuy(BuyDTO dto); 			// 멤버 등록
	public void insertGuestBuy(BuyDTO dto); 				// 게스트 등록
	public List<BuyDTO> bList();
	public List<BuyDTO> bListByMemberId(String member_id);
}
