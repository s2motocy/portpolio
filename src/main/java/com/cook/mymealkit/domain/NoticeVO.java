package com.cook.mymealkit.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class NoticeVO {
    private int bno;// 게시글 번호
    private String title;// 게시글 제목
    private String content;// 게시글 내용
    private String writer;// 게시글 작성자
    private Date regdate;// 게시글 업로드 날자
    private Date updateDate;// 게시글 업데이트
}
