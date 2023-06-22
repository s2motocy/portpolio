package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.ChartVO;

public interface AdminService {
	
	List<ChartVO> getUserCountByRegDate(ChartVO vo);
	
	List<ChartVO> getUserBuyCountByBuyDate(ChartVO vo);
	
}
