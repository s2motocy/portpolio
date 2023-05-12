package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BuyDTO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@Service
public class BuyServicempl implements BuyService{

	@Setter(onMethod_=@Autowired)
	BuyMapper bmapper;

	@Override
	public List<BuyDTO> bList() {
		System.out.println();
		return bmapper.bList();
	}

	@Override
	public List<BuyDTO> bListByMemberId(String member_id) {
		return bmapper.bListByMemberId(member_id);
	}

	@Override
	public void insertMBuy(BuyDTO dto) {
		System.out.println("Buy 서비스에서 회원 등록 : dto="+ dto);
		bmapper.insertMBuy(dto);
	}

	@Override
	public void insertGuestBuy(BuyDTO dto) {
		System.out.println("Buy 서비스에서 비회원 등록 : dto="+ dto);
		bmapper.insertGuestBuy(dto);
	}

}
