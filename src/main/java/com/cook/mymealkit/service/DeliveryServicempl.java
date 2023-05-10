package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.DeliveryVO;
import com.cook.mymealkit.mapper.DeliveryMapper;

import lombok.Setter;
@Service
public class DeliveryServicempl implements DeliveryService{

	@Setter(onMethod_=@Autowired)
	DeliveryMapper dmapper;
	
	@Override
	public List<DeliveryVO> delist() {
		return dmapper.delist();
	}

}
