package com.cook.mymealkit.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.service.ItemService;

import lombok.Setter;

@Controller
@RequestMapping("/item/*")
public class ItemController {
	
//	/* Mapper 설정 */
//	@Setter(onMethod_=@Autowired)
//	ItemMapper imapper;
	
	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	
	
	/* 상품 등록 |--------------------------------------------------- */
	@GetMapping("/register")
	public void register() {}
	
	@PostMapping("/register")
	public String insert(ItemVO vo) {
		System.out.println("Item 컨트롤러에서 등록 : vo="+ vo);
		if(vo.getAttachList() != null) {
			System.out.println(vo);
			vo.getAttachList().forEach(i->System.out.println(i));
		}
		iservice.itemInsert(vo);
		return "redirect:/item/itemList";
	}
	
	/* 상품 목록 |--------------------------------------------------- */
	@GetMapping("/itemList")
	public void itemList(Model model) {
		System.out.println("Item 컨트롤러에서 목록 : ");
		List<ItemVO> itemList = iservice.itemList();
		itemList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		model.addAttribute("list",itemList);
	}
	
	/* 상품 상세 |--------------------------------------------------- */
	@GetMapping("/detail")
	public void detail(@RequestParam("item_id") Long item_id, String user_id, Model model) {
		System.out.println("Item 컨트롤러에서 조회 : item_id="+ item_id+" , user_id: "+ user_id);
		ItemVO vo = iservice.itemFindById(item_id);
		List<AttachFileDTO> attachList = iservice.getAttachList(item_id);
		vo.setAttachList(attachList);
		System.out.println("조회한 값 저장: "+vo);
		model.addAttribute("list", vo);
		model.addAttribute("user_id", user_id);
	}
	
	/* 상품 수정 |--------------------------------------------------- */
	@GetMapping("/update")
	public void update(Model model,Long item_id) {
		System.out.println("Item 컨트롤러에서 수정(get) : item_id="+ item_id);
		model.addAttribute("vo", iservice.itemFindById(item_id));		
	}
	
	@PostMapping("/update")
	public String itemUpdate(ItemVO vo, RedirectAttributes rttr) {
		System.out.println("Item 컨트롤러에서 수정(post) : vo="+ vo);
		iservice.itemUpdate(vo);
		rttr.addFlashAttribute("list",iservice.itemList());
		return "redirect:/item/itemList";
	}
	
	/* 상품 삭제 |--------------------------------------------------- */
	@GetMapping("/delete")
	public String delete(int item_id) {
		System.out.println("Item 컨트롤러에서 삭제 : item_id="+ item_id);
		iservice.itemDelete(item_id);
		return "redirect:/item/itemList";
	}
	
	/* 카테고리 |--------------------------------------------------- */
	@GetMapping("/category")
	public String category(String category  , Model model) {
		System.out.println(category);
        List<ItemVO> categoryList = iservice.categoryItemList(category);
        System.out.println(categoryList);        
        categoryList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
        System.out.println(categoryList);
        model.addAttribute("categoryList", categoryList);
		return "/item/listByCategory";
    }
	
	/* 카테고리 전체|--------------------------------------------------- */
	@GetMapping("/categoryAll")
	public String all(Model model) {
		List<ItemVO> itemList = iservice.itemList();
		itemList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		 System.out.println("왜 4개밖에 안나옴" + itemList);        
		model.addAttribute("itemList",itemList);
		return "/item/categoryAll";
	}
	
	/* 신상품/인기상품 보기|--------------------------------------------------- */
	@GetMapping("/newOrBest")
	public String newI(@Param("itemType") String itemType,Model model) {
		System.out.println("itemType:"+itemType);
		ItemVO vo = new ItemVO();
		vo.setItemType(itemType);
		List<ItemVO> newItemList = iservice.categoryByNewOrBest(vo);
		System.out.println("itmelist : " + newItemList);
		newItemList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		System.out.println("이야ㅑ이야호" + newItemList);
		model.addAttribute("newItemList", newItemList);
		return "/item/newOrBest";
	}
	
	 @GetMapping("/between")
	    public ResponseEntity<List<ItemVO>> ubChartgogo(ItemVO vo){
		 System.out.println(vo);
		 List<ItemVO> list = iservice.categoryItemListByStartAndEnd(vo);
		 System.out.println("itmelist : " + list);
		 list.forEach(i->{
				List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
				i.setAttachList(attachList);
			});
		 return new ResponseEntity<>(list,HttpStatus.OK);
	    }

}
