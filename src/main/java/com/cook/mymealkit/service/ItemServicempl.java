package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.mapper.ItemMapper;

import lombok.Setter;

@Service
public class ItemServicempl implements ItemService{
	@Setter(onMethod_=@Autowired)
	private ItemMapper imapper;
	@Setter(onMethod_=@Autowired)
	private FileMapper fmapper;
	
	@Override
	public void itemInsert(ItemVO vo) {
		System.out.println("서비스에서 등록 : ");
		imapper.itemInsert(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) return ;
		vo.getAttachList().forEach(i->{
			System.out.println("변경 이전의 itemid ="+vo.getItemid());
			vo.setItemid(imapper.getMax());
			System.out.println("변경 이후의 itemid ="+vo.getItemid());
			i.setFid(vo.getItemid());
			fmapper.fileInsert(i);
		});
	}

	@Override
	public List<ItemVO> itemList() {
		System.out.println("서비스에서 목록 : ");
		return imapper.itemList();
	}

	@Override
	public ItemVO itemFindById(long itemid) {
		System.out.println("서비스에서 조회 : itemid=" +itemid);
		return imapper.itemFindById(itemid);
	}

	@Override
	public int itemUpdate(ItemVO vo) {
		System.out.println("서비스에서 수정 : vo=" +vo);
		return imapper.itemUpdate(vo);
	}

	@Override
	public int itemDelete(long itemid) {
		System.out.println("서비스에서 삭제 : itemid=" +itemid);
		return imapper.itemDelete(itemid);
	}

	@Override
	public List<AttachFileDTO> getAttachList(long itemid) {
		System.out.println("서비스에서 파일 정보 조회 : itemid=" +itemid);
		List<AttachFileDTO> attachList = fmapper.fileFindById(itemid);
		attachList.forEach(i->System.out.println("서비스에서 파일 정보 조회 : " +i ));
		return attachList;
	}

	@Override
	public ItemVO getByItemid(long itemid) {
		
		return imapper.getByItemid(itemid);
	}

}
