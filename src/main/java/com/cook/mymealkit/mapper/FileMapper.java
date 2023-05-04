package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.AttachFileDTO;

public interface FileMapper {
	
	public void fileInsert(AttachFileDTO dto);				// 등록
	public List<AttachFileDTO> fileFindById(long itemid);	// 조회
	
}
