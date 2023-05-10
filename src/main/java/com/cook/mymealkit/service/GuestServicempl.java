package com.cook.mymealkit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.GuestVO;
import com.cook.mymealkit.mapper.GuestMapper;

import lombok.Setter;

@Service
public class GuestServicempl implements GuestService{
	
	@Setter(onMethod_=@Autowired)
	GuestMapper gmapper;

	@Override
	public void insertGuest(GuestVO vo) {
		gmapper.insertGuest(vo);
	}

	@Override
	public GuestVO gListByEnvoice(GuestVO guestvo)  {
		// TODO Auto-generated method stub
		return gmapper.gListByEnvoice(guestvo);
	}



}
