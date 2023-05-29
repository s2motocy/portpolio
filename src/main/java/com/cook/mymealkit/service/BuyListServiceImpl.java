package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BuyListDTO;
import com.cook.mymealkit.mapper.BuyListMapper;

import lombok.Setter;

@Service
public class BuyListServiceImpl implements BuyListService {

	@Setter(onMethod_ = @Autowired)
	private BuyListMapper blistmapper;

	@Override
	public void register(BuyListDTO dto) {
		System.out.println("BuyList 서비스에서 등록 : dto=" + dto);
		blistmapper.register(dto);
	}

	@Override
	public List<BuyListDTO> buy_lists() {
		System.out.println("BuyList 서비스에서 목록 : ");
		return blistmapper.buy_lists();
	}

	@Override
	public List<BuyListDTO> listOfNo(String buy_no) {
		System.out.println("BuyList 서비스에서 조회 : buy_no=" + buy_no);
		return blistmapper.listOfNo(buy_no);
	}

}
