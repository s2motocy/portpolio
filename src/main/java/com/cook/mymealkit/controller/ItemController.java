package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.service.ItemService;

import lombok.Setter;

@Controller
@RequestMapping("/item/*")
public class ItemController {
	
	/* Mapper 설정 */
	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;
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
		System.out.println(vo);
		if(vo.getAttachList() != null) {
			System.out.println(vo);
			vo.getAttachList().forEach(i->fmapper.fileInsert(i));
		}
		imapper.itemInsert(vo);
		return "redirect:/item/itemList";
	}
	
	/* 상품 목록 |--------------------------------------------------- */
	@GetMapping("/itemList")
	public void itemList(Model model) {
		List<ItemVO> itemList = imapper.itemList();
		itemList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItemid());
			i.setAttachList(attachList);
		});
		model.addAttribute("list",itemList);
	}
	
	/* 상품 상세 |--------------------------------------------------- */
	@GetMapping("/detail")
	public void detail(@RequestParam("itemid") Long itemid, Model model) {
		ItemVO vo = iservice.itemFindById(itemid);
		List<AttachFileDTO> attachList = iservice.getAttachList(itemid);
		vo.setAttachList(attachList);
		model.addAttribute("list", vo);
	}
	
	
	/* 상품 수정 |--------------------------------------------------- */
	@GetMapping("/update")
	public void update(int itemid, Model model) {
		model.addAttribute("up", imapper.itemList());
	}
	
	@PostMapping("/update")
	public String itemUpdate(ItemVO vo, RedirectAttributes rttr) {
		imapper.itemUpdate(vo);
		rttr.addFlashAttribute("result");
		return "redirect:/item/itemList";
	}
}
