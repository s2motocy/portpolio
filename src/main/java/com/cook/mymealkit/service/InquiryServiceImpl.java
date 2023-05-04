package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cook.mymealkit.domain.InquiryVO;
import com.cook.mymealkit.mapper.InquiryMapper;

import lombok.Setter;


public class InquiryServiceImpl implements InquiryService{
	@Setter(onMethod_=@Autowired)
	InquiryMapper qmapper;

	@Override
	public List<InquiryVO> quest() {
		return qmapper.quest();
	}
	

}
