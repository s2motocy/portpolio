package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.service.ItemService;
import com.cook.mymealkit.service.ReplyService;

import lombok.Setter;

@Controller
public class MainController {
	/* Mapper 설정 */
	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;
	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	@Setter(onMethod_=@Autowired)
	ReplyService rservice;

	/* 메인 페이지 |--------------------------------------------------- */
	@RequestMapping({ "/", "/main" })
	public String main(Model model, String search) {
		if (search == null) {
			List<ItemVO> itemList = imapper.itemList();
			itemList.forEach(i -> {
				List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
				i.setAttachList(attachList);
				int cnt = rservice.getReplyTotal((long)i.getItem_id());
				i.setReplyCnt(cnt);
			});
			model.addAttribute("list", itemList);
		} else {
			List<ItemVO> itemList = imapper.itemListBySearch(search);
			itemList.forEach(i -> {
				List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
				i.setAttachList(attachList);
				int cnt = rservice.getReplyTotal((long)i.getItem_id());
				i.setReplyCnt(cnt);
			});
			model.addAttribute("list", itemList);
		}
		return "main";
	}
}
