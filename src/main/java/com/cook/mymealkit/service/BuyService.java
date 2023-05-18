package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.BuyGuestVO;
import com.cook.mymealkit.domain.BuyUserVO;


public interface BuyService {
	
	/* 회원 */
	public void insertUserBuy(BuyUserVO vo); 				// 회원구매 등록
	public List<BuyUserVO> userBuyList();  					// 회원구매 목록
	public List<BuyUserVO> bListByUserId(String user_id); 	// 회원구매 조회
	public int getMaxBno();									// bno 최대값 조회
	
	
	/* 비회원 */
	public void insertGuestBuy(BuyGuestVO vo); 				// 게스트구매 등록
	public List<BuyGuestVO> guestBuyList();					// 게스트구매 목록
	public List<BuyGuestVO> bListByGuestId(String buy_no);	// 게스트구매 조회
	public int getMaxGno();									// gno 최대값 조회
	
}
