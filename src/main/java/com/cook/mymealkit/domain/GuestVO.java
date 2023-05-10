package com.cook.mymealkit.domain;

import lombok.Data;

@Data
public class GuestVO {
	
	private Long gid;
	private String name;
	private String pnum;
	private String pwd;
	private String address;
	private String deaddress;
	private Long itemid; 
	private String envoice_no; 

}
