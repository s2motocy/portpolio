package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BuyListDTO {

	private int b_num;				// 주문목록 번호
	private String blist_no;		// 조회 번호
	private String item_id;			// 상품 번호
	private String item_name;		// 상품 이름			
	private int amount;				// 수량
	private int total_price;		// 가격			
	private int delivery_cost;		// 배송비
	
}
