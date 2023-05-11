package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.BuyVO;
import com.cook.mymealkit.mapper.BuyMapper;

import lombok.Setter;

@Service
public class BuyServicempl implements BuyService{

	@Setter(onMethod_=@Autowired)
	BuyMapper bmapper;

	@Override
	public List<BuyVO> bList() {
		return bmapper.bList();
	}

	@Override
	public List<BuyVO> bListByMemberId(String member_id) {
		return bmapper.bListByMemberId(member_id);
	}

}
