package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.CartDTO;

public interface CartService {
	
	public void cartInsert(CartDTO dto);
	public List<CartDTO> cartList();
	public CartDTO cartFindById(int cart_id);
	public void cartUpdate(CartDTO dto);
	public void cartDelete(int cart_id);
}
