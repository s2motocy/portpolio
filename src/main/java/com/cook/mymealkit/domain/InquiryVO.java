package com.cook.mymealkit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InquiryVO {
	private int qno;
	private String title;
	private String content;
	private String writer;
	private Date update_date;
	private Date register_date;
	private int reply_cnt;
}
