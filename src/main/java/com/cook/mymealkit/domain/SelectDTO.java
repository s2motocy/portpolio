package com.cook.mymealkit.domain;

import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class SelectDTO {

	/* 상품 id */
	private int item_id;

	/* 상품 이름 */
	private String item_name;

	/* 상품 이미지 */
	private List<AttachFileDTO> imageList;

}
