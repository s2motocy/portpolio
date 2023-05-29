package com.cook.mymealkit.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyDTO {
	private int reply_id;

	private int item_id;

	private String user_id;

	/* 날짜가 이상하게 구현되서 추가한 로직 */
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regDate;

	private String content;

	private double rating;
}
