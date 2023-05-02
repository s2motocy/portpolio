package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.service.ItemService;
import com.cook.mymealkit.vo.ItemVO;

import lombok.Setter;

@Controller
@RequestMapping("/item/*")
public class ItemController {
	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;
	
	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	
	
	@GetMapping("/register")
	public String item() {
		return "/item/register";
	}
	
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
	
	@GetMapping("/itemList")
	public String itemList(Model model) {
		List<ItemVO>itemList = imapper.itemList();
		model.addAttribute("list",itemList);
		return "/item/itemList";
	}
	
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
