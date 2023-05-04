package com.cook.mymealkit.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class DeliveryVO {

	private Long dno;  // 시퀀스, 송장번호 
	
	private Long delivery_no;  //주문 번호
	
	private String member_id;  // 주문자 아이디
	
	private Long price;  // 상품가격
	
	private String item;  // 주문 상품
	
	private String delivery;  // 주문 상태
	
	private Date delivery_date;  // 주문한 날짜
	
	private Long member_no;  // 주문한 고객 정보로 조회 

}
