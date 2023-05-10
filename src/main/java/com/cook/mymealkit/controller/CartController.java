package com.cook.mymealkit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.CartDTO;
import com.cook.mymealkit.mapper.ItemMapper;
import com.cook.mymealkit.service.CartService;
import com.cook.mymealkit.service.ItemService;

import lombok.Setter;

@Controller
@RequestMapping("/cart/*")
public class CartController {
	
	/* Service 설정 */
	@Setter(onMethod_=@Autowired)
	private CartService cservice;
	@Setter(onMethod_=@Autowired)
	private ItemService iservice;
	
	/* Mapper 설정 */
	@Setter(onMethod_=@Autowired)
	private ItemMapper imapper;
	
	
	/* 장바구니 등록 |--------------------------------------------------- */
	@PostMapping("/register")
	public String cartInsert(CartDTO dto) {
		System.out.println("cart 컨트롤러에서 등록 : dto="+ dto);
		List<CartDTO> cartList = cservice.cartList();
		
		/* DB에 값이 있을때 */
		for(int i=0;i<cartList.size();i++) {
			if(cartList.get(i).getItem_id().equals(dto.getItem_id())) {
				int amount = cartList.get(i).getAmount() + dto.getAmount();
				int price = amount * imapper.get_price(cartList.get(i).getItem_id());
				dto.setAmount(amount);
				dto.setPrice(price);
				System.out.println("변경된 dto="+ dto);
				cservice.cartUpdate(dto);
				return "redirect:/cart/cartList";
			}
		}
		
		/* DB에 값이 없을때 */
		System.out.println("DB에 값이 없어 추가합니다");
		cservice.cartInsert(dto);
		return "redirect:/cart/cartList";
	}
	
	/* 장바구니 목록 |--------------------------------------------------- */
	@GetMapping("/cartList")
	public void cartList(Model model) {
		System.out.println("cart 컨트롤러에서 목록 : ");
		List<CartDTO> dtoList = cservice.cartList();
		System.out.println(dtoList);
		
		dtoList.forEach(i->{
			List<AttachFileDTO> attachList = iservice.getAttachList(i.getItem_id());
			System.out.println("cart 컨트롤러의 목록에서 attachList="+attachList);
			i.setAttachList(attachList);
			i.setItem_price(imapper.get_price(i.getItem_id()));
		});
		System.out.println(dtoList);
		model.addAttribute("dtoList", dtoList);
	}
	
	/* 장바구니 수정 |--------------------------------------------------- */
	@PostMapping("/cartUpdate")
	public String cartUpdate(CartDTO dto) {
		System.out.println("cart 컨트롤러에서 수정 : dto="+dto);
		cservice.cartUpdate(dto);
		return "redirect:/cart/cartList";
	}
	
	/* 장바구니 삭제 |--------------------------------------------------- */
	@PostMapping("/cartDelete")
	public String cartDelete(int cart_id) {
		System.out.println("cart 컨트롤러에서 삭제 : cart_id="+ cart_id);
		cservice.cartDelete(cart_id);
		return "redirect:/cart/cartList";
	}
}
