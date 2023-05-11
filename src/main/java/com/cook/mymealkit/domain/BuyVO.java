package com.cook.mymealkit.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BuyVO {
	
	private Long bno; // 시퀸스
	private String buy_no; // 주문 번호
	private String member_id; // 주문자 아이디번호
	private String cart_id; // 주문 상품
	private String buy; // 시퀀스 주문 상태
	private Date buy_date; // 주문한 날짜
	private int price; // 주문 금액

}
