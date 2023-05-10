package com.cook.mymealkit.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private int id, readcnt, root, step, indent;
	private String title, content, writer;
	private Date writedate;

}
