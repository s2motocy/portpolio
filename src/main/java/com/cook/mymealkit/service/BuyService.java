package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.BuyVO;


public interface BuyService {

	public List<BuyVO> bList();
	public List<BuyVO> bListByMemberId(String member_id);
}
