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
