package com.cook.mymealkit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.domain.ReplyDTO;
import com.cook.mymealkit.service.FileService;
import com.cook.mymealkit.service.ItemService;
import com.cook.mymealkit.service.ReplyService;

import lombok.Setter;

@Controller
@RequestMapping("/item/*")
public class ItemController {
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	FileService fservice;
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	@Setter(onMethod_=@Autowired)
	ReplyService rservice;

	/* 상품 등록 |--------------------------------------------------- */
	@GetMapping("/register")
	public void register() {}

	@PostMapping("/register")
	public String insert(ItemVO vo) {
		if (vo.getAttachList() != null) {
			/* vo.getAttachList().forEach(i -> fmapper.fileInsert(i)); */
			iservice.itemInsert(vo);
		}
		
		return "redirect:/item/categoryAll";
	}

	/* 상품 목록 |--------------------------------------------------- */
	@GetMapping("/itemList")
	public void itemList(Model model, String search) {
		if (search == null) {
			List<ItemVO> itemList = iservice.itemList();
			itemList.forEach(i -> {
				List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
				i.setAttachList(attachList);
				int cnt = rservice.getReplyTotal((long)i.getItem_id());
				i.setReplyCnt(cnt);
			});
			model.addAttribute("list", itemList);
		} else {
			List<ItemVO> itemList = iservice.itemListBySearch(search);
			itemList.forEach(i -> {
				List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
				i.setAttachList(attachList);
				int cnt = rservice.getReplyTotal((long)i.getItem_id());
				i.setReplyCnt(cnt);
			});
			model.addAttribute("list", itemList);
		}
	}

	/* 상품 상세 |--------------------------------------------------- */
	@GetMapping("/detail")
	public void detail(@RequestParam("item_id") Long item_id, String user_id, Model model, HttpServletRequest request) {
		ItemVO ivo = iservice.itemFindById(item_id);
		List<AttachFileDTO> attachList = iservice.getAttachList(item_id);
		ivo.setAttachList(attachList);
		int cnt = rservice.getReplyTotal(item_id);
		ivo.setReplyCnt(cnt);
		model.addAttribute("item", ivo);
		model.addAttribute("user_id", user_id);
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		List<ItemVO> rct = (List<ItemVO>)session.getAttribute("rct");
		if (rct == null){
			List<ItemVO> qwer = new ArrayList<>();
			qwer.add(0,ivo);
			session.setAttribute("rct" ,qwer );
		} else {
			rct.add(0,ivo);
			if (rct.size()>3) {
				rct.remove(3);
			}
		}
		
	}

	/* 상품 수정 |--------------------------------------------------- */
	@GetMapping("/update")
	public void update(Model model, Long item_id) {
		model.addAttribute("ivo", iservice.itemFindById(item_id));
	}

	@PostMapping("/update")
	public String itemUpdate(ItemVO vo, RedirectAttributes rttr) {
		iservice.itemUpdate(vo);
		rttr.addFlashAttribute("list", iservice.itemList());
		return "redirect:/item/categoryAll";
	}

	/* 상품 삭제 |--------------------------------------------------- */
	@GetMapping("/delete")
	public String delete(int item_id) {
		System.out.println("Item 컨트롤러에서 삭제 : item_id=" + item_id);
		iservice.itemDelete(item_id);
		fservice.deleteAll(item_id);
		return "redirect:/item/categoryAll";
	}

	/* 카테고리 |--------------------------------------------------- */
	@GetMapping("/category")
	public String category(String category, Model model) {
		List<ItemVO> categoryList = iservice.categoryItemList(category);
		categoryList.forEach(i -> {
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("category", category);
		return "/item/listByCategory";
	}

	/* 카테고리 전체|--------------------------------------------------- */
	@GetMapping("/categoryAll")
	public String all(Model model, String user_id) {
		List<ItemVO> itemList = iservice.itemList();
		itemList.forEach(i -> {
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		model.addAttribute("itemList", itemList);
		model.addAttribute("user_id", user_id);
		return "/item/categoryAll";
	}

	/* 신상품/인기상품 보기 |--------------------------------------------------- */
	@GetMapping("/newOrBest")
	public String newI(@Param("itemType") String itemType, Model model) {
		ItemVO vo = new ItemVO();
		vo.setItemType(itemType);
		List<ItemVO> newItemList = iservice.categoryByNewOrBest(vo);
		newItemList.forEach(i -> {
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		model.addAttribute("newItemList", newItemList);
		return "/item/newOrBest";
	}
	
	@GetMapping("/between")
	public ResponseEntity<List<ItemVO>> ubChartgogo(ItemVO vo){
		List<ItemVO> list = iservice.categoryItemListByStartAndEnd(vo);
		list.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		return new ResponseEntity<>(list,HttpStatus.OK);
	}

	/* 리뷰 등록 |--------------------------------------------------- */
	@GetMapping("/replyEnroll/{user_id}")
	public String replyEnrollWindowGET(@PathVariable("user_id") String user_id, long item_id, Model model) {
		ItemVO item = iservice.getItemIdName(item_id);
		model.addAttribute("list", item);
		model.addAttribute("user_id", user_id);
		return "/item/replyEnroll";
	}

	/* 리뷰 수정 팝업창 |--------------------------------------------------- */
	@GetMapping("/replyUpdate")
	public String replyUpdateWindowGET(ReplyDTO dto, Model model) {
		ItemVO item = iservice.getItemIdName(dto.getItem_id());
		model.addAttribute("list", item);
		model.addAttribute("replyInfo", rservice.getUpdateReply(dto.getReply_id()));
		model.addAttribute("user_id", dto.getUser_id());
		return "/item/replyUpdate";
	}
}
