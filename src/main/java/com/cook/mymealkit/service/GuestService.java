package com.cook.mymealkit.service;

import com.cook.mymealkit.domain.GuestVO;

public interface GuestService {
	
	public void insertGuest(GuestVO vo);
	
	public GuestVO gListByEnvoice(GuestVO guestvo); 
}
