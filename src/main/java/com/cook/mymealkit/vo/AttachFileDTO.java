package com.cook.mymealkit.vo;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class AttachFileDTO {
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	private boolean fileType; // 이미지 여부
}
