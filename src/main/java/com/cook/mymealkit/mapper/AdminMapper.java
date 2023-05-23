package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.ChartVO;

public interface AdminMapper {

	 List<ChartVO> getUserCountByRegDate(ChartVO vo);
	 
	 List<ChartVO> getUserBuyCountByBuyDate(ChartVO vo);
}
