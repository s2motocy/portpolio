package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class MemberVO {

	 private Long member_id;
	 private String name;
	 private String id;
	 private String pwd;
	 private String pwd2;
	 private String email;
	 private String pnum;
	 private String hnum;
	 private String address;
	 private String moreaddress;
}
