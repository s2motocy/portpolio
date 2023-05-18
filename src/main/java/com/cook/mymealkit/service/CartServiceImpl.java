package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.CartDTO;
import com.cook.mymealkit.mapper.CartMapper;

import lombok.Setter;

@Service
public class CartServiceImpl implements CartService {

	@Setter(onMethod_=@Autowired)
	private CartMapper cmapper;
	
	@Override
	public void cartInsert(CartDTO dto) {
		System.out.println("Cart 서비스에서 등록 : dto="+ dto);
		cmapper.cartInsert(dto);
	}

	@Override
	public List<CartDTO> cartList() {
		System.out.println("Cart 서비스에서 목록 : ");
		return cmapper.cartList();
	}

	@Override
	public CartDTO cartFindById(long cart_id) {
		System.out.println("Cart 서비스에서 조회 : itemid="+ cart_id);
		return cmapper.cartFindById(cart_id);
	}

	@Override
	public void cartUpdate(CartDTO dto) {
		System.out.println("Cart 서비스에서 수정 : dto="+ dto);
		cmapper.cartUpdate(dto);
	}

	@Override
	public void cartDelete(long cart_id) {
		System.out.println("Cart 서비스에서 삭제 : cart_id="+ cart_id);
		cmapper.cartDelete(cart_id);
	}

	@Override
	public void cartAllRemove() {
		System.out.println("Cart 서비스에서 전체삭제 : ");
		cmapper.cartAllRemove();
	}

}
