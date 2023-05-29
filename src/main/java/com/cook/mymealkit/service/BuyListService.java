package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.BuyListDTO;

public interface BuyListService {

	public void register(BuyListDTO dto);

	public List<BuyListDTO> buy_lists();

	public List<BuyListDTO> listOfNo(String buy_no);

}
