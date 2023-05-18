package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.CartDTO;

public interface CartService {
	
	public void cartInsert(CartDTO dto);			// 등록
	public List<CartDTO> cartList();				// 목록
	public CartDTO cartFindById(long cart_id);		// 조회
	public void cartUpdate(CartDTO dto);			// 수정
	public void cartDelete(long cart_id); 			// 삭제
	public void cartAllRemove();					// 전체삭제
	
}
