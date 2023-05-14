package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BuyGuestVO;
import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@Service
public class BuyServicempl implements BuyService{

	@Setter(onMethod_=@Autowired)
	BuyMapper bmapper;

	@Override
	public void insertUserBuy(BuyUserVO vo) {
		System.out.println("Buy 서비스에서 User 등록 : vo="+ vo);
		bmapper.insertUserBuy(vo);
	}

	@Override
	public List<BuyUserVO> userBuyList() {
		System.out.println("Buy 서비스에서 User 목록 : ");
		return bmapper.userBuyList();
	}

	@Override
	public List<BuyUserVO> bListByUserId(String user_id) {
		System.out.println("Buy 서비스에서 User 조회 : user_id="+ user_id);
		return bmapper.bListByUserId(user_id);
	}

	@Override
	public void insertGuestBuy(BuyGuestVO vo) {
		System.out.println("Buy 서비스에서 Guest 등록 : vo="+ vo);
		bmapper.insertGuestBuy(vo);
	}

	@Override
	public List<BuyGuestVO> guestBuyList() {
		System.out.println("Buy 서비스에서 Guest 목록 : ");
		return bmapper.guestBuyList();
	}

	@Override
	public List<BuyGuestVO> bListByGuestId(String buy_no) {
		System.out.println("Buy 서비스에서 Guest 조회 : buy_no="+ buy_no);
		return bmapper.bListByGuestId(buy_no);
	}

	
}
