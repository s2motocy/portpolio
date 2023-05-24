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

import lombok.Setter;

@Controller
public class MainController {
	
	@Setter(onMethod_=@Autowired)
	ItemMapper imapper;
	
	@Setter(onMethod_=@Autowired)
	FileMapper fmapper;
	
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	ItemService iservice;
	
	@RequestMapping({"/","/main"})
	public String main(Model model) {
		List<ItemVO> itemList = imapper.itemList();
		itemList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			i.setAttachList(attachList);
		});
		model.addAttribute("list",itemList);
		return "/main";
	}
	
}
