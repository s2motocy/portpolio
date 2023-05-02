package com.cook.mymealkit.mapper;

import java.util.List;
import com.cook.mymealkit.vo.AttachFileDTO;

public interface FileMapper {
	
	public void fileInsert(AttachFileDTO dto);
	
	public List<AttachFileDTO> getFileInfo();
}
