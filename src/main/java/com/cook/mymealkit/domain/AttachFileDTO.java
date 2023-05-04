package com.cook.mymealkit.domain;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class AttachFileDTO {
	
	private Long fid;				// 아이디
	private String fileName;		// 파일 이름
	private boolean image; 			// 이미지 여부
	private String uuid;			// UUID
	private String uploadPath;		// 파일 경로
	
}
