package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.ChartVO;
import com.cook.mymealkit.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_=@Autowired)
	AdminMapper amapper;
	
	@Override
	public List<ChartVO> getUserCountByRegDate(ChartVO vo) {
		
		return amapper.getUserCountByRegDate(vo);
	}

	@Override
	public List<ChartVO> getUserBuyCountByBuyDate(ChartVO vo) {
		
		return amapper.getUserBuyCountByBuyDate(vo);
	}

}
