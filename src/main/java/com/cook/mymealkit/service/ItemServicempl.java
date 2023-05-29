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
	
	/* Mapper 설정 */
	@Setter(onMethod_=@Autowired)
	private ItemMapper imapper;
	@Setter(onMethod_=@Autowired)
	private FileMapper fmapper;
	
	@Override
	public void itemInsert(ItemVO vo) {
		System.out.println("Item 서비스에서 등록 : vo="+ vo);
		imapper.itemInsert(vo);
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) return ;
		vo.getAttachList().forEach(i->{
			System.out.println("변경 이전의 item_id ="+vo.getItem_id());
			vo.setItem_id(imapper.getMax());
			System.out.println("변경 이후의 itemid ="+vo.getItem_id());
			i.setFid(vo.getItem_id());
			fmapper.fileInsert(i);
		});
	}

	@Override
	public List<ItemVO> itemList() {
		System.out.println("Item 서비스에서 목록 : ");
		return imapper.itemList();
	}

	@Override
	public ItemVO itemFindById(long item_id) {
		System.out.println("Item 서비스에서 조회 : item_id=" +item_id);
		return imapper.itemFindById(item_id);
	}

	@Override
	public int itemUpdate(ItemVO vo) {
		System.out.println("Item 서비스에서 수정 : vo=" +vo);
		return imapper.itemUpdate(vo);
	}

	@Override
	public int itemDelete(long item_id) {
		System.out.println("Item 서비스에서 삭제 : item_id=" +item_id);
		return imapper.itemDelete(item_id);
	}

	@Override
	public List<AttachFileDTO> getAttachList(long item_id) {
		System.out.println("Item 서비스에서 파일 정보 조회 : item_id=" +item_id);
		List<AttachFileDTO> attachList = fmapper.fileFindById(item_id);
		attachList.forEach(i->System.out.println("Item 서비스에서 각 파일 정보 조회 : " + i ));
		return attachList;
	}

	@Override
	public List<ItemVO> categoryItemList(String category) {
		return imapper.categoryItemList(category);
	}

	@Override
	public List<ItemVO> categoryByNewOrBest(ItemVO vo) {
		return imapper.categoryByNewOrBest(vo);
		
	}

	@Override
	public List<ItemVO> categoryItemListByStartAndEnd(ItemVO vo) {
		return imapper.categoryItemListByStartAndEnd(vo);
	}



}
