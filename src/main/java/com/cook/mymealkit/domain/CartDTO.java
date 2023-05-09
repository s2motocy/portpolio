package com.cook.mymealkit.domain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CartDTO {
	
	/* 장바구니 정보 */
	private int cart_id;
	private int amount;
	private int price;
	
	/* 회원 정보 */
	private int member_id;
	
	/* 상품 정보 */
	private Long item_id;
	private String item_name;
	
	/* 상품 이미지 (추가) */
	private List<AttachFileDTO> attachList;
	
	/* 단가 (추가) */
	private int item_price;
}
