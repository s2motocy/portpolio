package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.mapper.FileMapper;

import lombok.Setter;

@Service
public class FileServiceImpl implements FileService {

	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	
	@Override
	public void fileInsert(AttachFileDTO dto) {
		fmapper.fileInsert(dto);
	}

	@Override
	public List<AttachFileDTO> fileFindById(long item_id) {
		
		return fmapper.fileFindById(item_id);
	}

	@Override
	public void deleteImageFile(AttachFileDTO dto) {
		fmapper.deleteImageFile(dto);
	}

	@Override
	public void delete(String uuid) {
		fmapper.delete(uuid);
	}

	@Override
	public void deleteAll(long item_id) {
		fmapper.deleteAll(item_id);
	}

}
