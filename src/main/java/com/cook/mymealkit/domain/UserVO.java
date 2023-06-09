package com.cook.mymealkit.domain;

import java.util.Date;

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
public class UserVO {
	private long uno;			// 회원번호
	private String user_name;	// 사용자 이름
	private String user_id;		// 사용자 아이디
	private String pwd;			// 사용자 비밀번호
	private String pwd2;		// 비밀번호 확인
	private String email;		// 사용자 이메일
	private String phone;		// 사용자 전화번호
	private String post_code;	// 우편 번호
	private String addr;		// 사용자 주소
	private String addr2;		// 사용자 상세주소
	private String auth;		// 관리자 권한
	private Date reg_date;
	
}
