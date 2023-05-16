package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserVO {

	 private String user_id;
	 private String user_name;
	 private String pwd;
	 private String email;
	 private String phone;
	 private String post_code;
	 private String addr;
	 private String addr2;
	 private String auth;
	 
}


//user_id     varchar2(50) not null primary key,      -- 아이디
//user_name   varchar2(50) not null,                  -- 이름
//pwd	        varchar2(50) not null,                  -- 비밀번호
//email	    varchar2(50) not null,                  -- 이메일
//phone	    varchar2(50) not null,                  -- 연락처
//post_code   varchar2(30),                           -- 우편번호 (선택)
//addr        varchar2(50),                           -- 주소 (선택)
//addr2       varchar2(50),                           -- 상세주소 (선택)
//auth        char(1) default 'm'                     -- 권한