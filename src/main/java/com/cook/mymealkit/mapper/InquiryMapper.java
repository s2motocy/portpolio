package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.InquiryVO;


public interface InquiryMapper {
	public void Inquiryinsert(InquiryVO vo);
	
	public List<InquiryVO> quest();

}
