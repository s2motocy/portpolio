package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UpdateReplyDTO {

	private long item_id;
	
	private double ratingAvg;
	
}
