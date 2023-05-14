package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.CartDTO;

@Mapper
public interface CartMapper {
	
	public void cartInsert(CartDTO dto);			// 등록
	public List<CartDTO> cartList();				// 목록
	public CartDTO cartFindById(long cart_id);		// 조회
	public void cartUpdate(CartDTO dto);			// 수정
	public void cartDelete(long cart_id);			// 삭제
	
}
