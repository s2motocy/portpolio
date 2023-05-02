package com.cook.mymealkit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ItemVO {
	private Long itemid;
	
	private String name;
	
	private String category;
	
	private int price;
	
	private String description;
	
	private Date update_date;
	
	private List<AttachFileDTO> attachList;

}
