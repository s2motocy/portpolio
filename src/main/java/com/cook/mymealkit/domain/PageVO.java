package com.cook.mymealkit.domain;

import lombok.Data;

@Data
public class PageVO {
	private int pageList=10;
	private int block=10;
	private int totalList;
	private int totalPage;
	private int totalBlock;
	private int curPage;
	private int beginList, endList;
	private int beginPage, endPage;
	private String search;
	private String keyword;
	private String viewType="list";

}
