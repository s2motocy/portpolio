package com.cook.mymealkit.domain;

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
public class MemberVO {
	private int bno;
	 private String name;
	 private String id;
	 private String pwd;
	 private String pwd2;
	 private String email;
	 private String pnum;
	 private String hnum;
	 private String address;
}
