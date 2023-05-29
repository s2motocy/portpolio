package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ChartVO {
	private String startDate;
	private String endDate;
	private int cnt;
	private String reg_date;

	private String startDateB;
	private String endDateB;
	private int buyCnt;
	private String buy_date;
}
