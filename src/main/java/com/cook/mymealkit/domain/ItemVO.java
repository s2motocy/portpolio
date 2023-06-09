package com.cook.mymealkit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ItemVO {
	/* 테이블 데이터 */
	private Long item_id; 					// 상품 번호
	private String category; 				// 상품 분류
	private String item_name; 				// 상품 이름
	private int item_price; 				// 상품 가격
	private String description; 			// 상품 설명

	private int item_stock; 				// 상품 재고
	private int item_sold;					// 상품 판매량
  	private Date update_date;				// 수정일
  	
  	private String itemType;				// 신상품,인기상품 분류
  	private String start;					// 최소 가격
  	private String end;						// 최대 가격
  	private double ratingAvg;				// 별점 평균
	private int  replyCnt;					// 댓글 개수
  	
	/* 참조 데이터 */
	private List<AttachFileDTO> attachList; // 파일(이미지) 정보

}
