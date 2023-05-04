package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class CartVO {
	
	private int cart_id;
	private int member_id;
	private int item_id;
	private String item_name;
	private int amount;
	private int price;
	private String item_img;
	
}
