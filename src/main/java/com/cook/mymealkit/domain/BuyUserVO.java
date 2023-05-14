package com.cook.mymealkit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class BuyUserVO {
	
	private int bno; 					// 시퀸스
	private String buy_no; 				// 주문 번호
	private String user_id; 			// 주문자 아이디
	private String buyer_name; 			// 배송받을 이름
	private String phone;				// 연락처
	private String post_code; 			// 우편번호
	private String addr; 				// 주소
	private String addr2; 				// 주소(상세)
	private String buy; 				// 시퀀스 주문 상태
	private Date buy_date; 				// 주문한 날짜
	
	private List<BuyListDTO> buy_list; 	// 주문 목록	
	
}

