package com.cook.mymealkit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ItemVO {
	
	private Long itemid;						// 상품 번호
	private String name;						// 상품 이름
	private String category;					// 상품 분류
	private int price;							// 상품 가격
	private String description;					// 상품 설명
	private Date update_date;					// 수정일
	private List<AttachFileDTO> attachList;		// 파일 정보

}
