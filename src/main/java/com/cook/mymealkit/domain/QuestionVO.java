package com.cook.mymealkit.domain;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class QuestionVO {

    /* 문의 번호 */
    private int qno;

    /* 문의 제목 */
    private String title;

    /* 문의 내용 */
    private String content;

    /* 문의자 */
    private String writer;

    /* 등록 날짜 */
    private Date writedate;

    /* 수정 날짜 */
    private Date updateDate;

    /* 조회수 */
    private int readcnt;

    /* 비밀번호 */
    private String password;

    /* 답변 */
    private String reply;

    /* 문의 종류 */
    private String category;

}
