package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.CartDTO;

@Mapper
public interface CartMapper {
	public void cartInsert(CartDTO dto);
	public List<CartDTO> cartList();
	public CartDTO cartFindById(int cart_id);
	public void cartUpdate(CartDTO dto);
	public void cartDelete(int cart_id);
}
