package com.cook.mymealkit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cook.mymealkit.domain.AttachFileDTO;
import com.cook.mymealkit.domain.BuyGuestVO;
import com.cook.mymealkit.domain.BuyListDTO;
import com.cook.mymealkit.domain.BuyUserVO;
import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.FileMapper;
import com.cook.mymealkit.service.BuyListService;
import com.cook.mymealkit.service.BuyService;
import com.cook.mymealkit.service.ItemService;
import com.cook.mymealkit.service.UserService;

import lombok.Setter;

@Controller
@RequestMapping("/buy/*")
public class BuyController {

	@Setter(onMethod_ = @Autowired)
	BuyService bservice;
	@Setter(onMethod_ = @Autowired)
	UserService uservice;
	@Setter(onMethod_ = @Autowired)
	ItemService iservice;
	@Setter(onMethod_ = @Autowired)
	BuyListService blistservice;
	@Setter(onMethod_ = @Autowired)
	FileMapper fmapper;

	/* 회원 구매 로그인 */
	@GetMapping("/buyLogin")
	public void registerUser(BuyUserVO bvo, BuyGuestVO gvo, HttpSession session, Model model) {
		System.out.println("vo : " + bvo);
		model.addAttribute("test", gvo);
		// 여기 페이지에서 login 관련만 화면에 보이게 하고 나머지는 hidden으로 감춘후 처리함
	}

	/* 로그인 세션처리 */
	@PostMapping("/buyLogin")
	public ResponseEntity<String> UserLoginPost(@RequestBody UserVO uvo, BuyUserVO bvo, HttpSession session) {
		System.out.println("uvo:"+uvo+" ,bvo:"+bvo);
		if(uvo.getUser_id() ==null || uvo.getUser_id().isEmpty() || uvo.getPwd() == null || uvo.getPwd().isEmpty()) {
			System.out.println("user_id 와 pwd 의 값이 없습니다 [response code = 1]");
			// user_id 와 pwd 의 값이 없을때 1 을 반환
			return new ResponseEntity<>("1", HttpStatus.BAD_REQUEST);
		} else if(uservice.getUserById(uvo.getUser_id()) == null) {
			System.out.println("DB 에 user_id 와 일치하는 데이터가 없습니다 [response code = 2]");
			// DB 에 user_id 와 일치하는 데이터가 없을때 2 를 반환
			return new ResponseEntity<>("2", HttpStatus.BAD_REQUEST);
		} else {
			UserVO vo = uservice.getUserById(uvo.getUser_id());
			if(!uvo.getPwd().equals(vo.getPwd())) {
				System.out.println("조회한 데이터의 비밀번호와 입력한 비밀번호가 같지 않습니다 [error code = 3]");
				// 조회한 데이터의 비밀번호와 입력한 비밀번호가 같지 않으면 3 을 반환
				return new ResponseEntity<>("3", HttpStatus.BAD_REQUEST);
			}
			// 정상 데이터 일때 로그인
			boolean success = uservice.login(vo);
			if(!success) {
				System.out.println("로그인시 오류가 발생되었습니다 [response code = 4]");
				// 중복으로 확인
				return new ResponseEntity<>("4", HttpStatus.BAD_REQUEST);
			}
			// 로그인
			session.setAttribute("user", vo);

			// 정상 로그인이 가능할때 0 을 반환
			System.out.println("정상적으로 로그인되었습니다 [response code = 0]");
			return new ResponseEntity<>("0", HttpStatus.OK);
		}
	}

	/* 회원 구매 페이지 */
	@GetMapping("/buyUser")
	public void register(UserVO uvo, BuyUserVO bvo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println("BuyUser 에서 uvo : " + uvo + " , bvo" + bvo);

		if (session.getAttribute("user") != null) {

			UserVO vo = uservice.getUserById(uvo.getUser_id());
			System.out.println("vo: " + vo);
			model.addAttribute("vo", vo);

			/* 구매정보 */
			String str = "u"; // 문자열(u: user의 앞글자) 생성
			int bno = bservice.getMaxBno() + 1; // bno 의 최대값+1
			for (int i = 0; i < 6 - Integer.toString(bno).length(); i++) {
				str += "0";
			} // 6자리 숫자 생성위해 길이만큼을 뺀 나머지를 0으로 채움
			str += bno; // bno 를 넣음
			bvo.setBuy_no(str); // u + 00000 + 1 = u000001
			bvo.setBuyer_name(vo.getUser_name());
			bvo.setPhone(vo.getPhone());
			bvo.setPost_code(vo.getPost_code());
			bvo.setAddr(vo.getAddr());
			bvo.setAddr2(vo.getAddr2());
			System.out.println("입력된 bvo : " + bvo);
			model.addAttribute("data", bvo);

			/* 상품정보 */
			model.addAttribute("dlist", bvo.getBuy_list());

			/* 상품이미지 정보 */
			List<BuyListDTO> dtos = bvo.getBuy_list();
			List<ItemVO> volist = new ArrayList<ItemVO>();
			dtos.forEach(i -> {
				i.setBuy_no(bvo.getBuy_no());
				ItemVO ivo = iservice.itemFindById(Integer.parseInt(i.getItem_id()));

				List<AttachFileDTO> afdto = iservice.getAttachList(Integer.parseInt(i.getItem_id()));
				ivo.setAttachList(afdto);
				volist.add(ivo);
			});
			System.out.println("volist: " + volist);
			model.addAttribute("vlist", volist);

		}
	}

	/* 비회원 구매 페이지 */
	@GetMapping("/buyGuest")
	public void guestRegister(BuyGuestVO gvo, Model model) {
		System.out.println("BuyGuest 에서 gvo : " + gvo);

		/* 구매정보 */
		String str = "g"; // 문자열(u: user의 앞글자) 생성
		int gno = bservice.getMaxGno() + 1; // gno 의 최대값+1
		for (int i = 0; i < 6 - Integer.toString(gno).length(); i++) {
			str += "0";
		} // 6자리 숫자 생성위해 길이만큼을 뺀 나머지를 0으로 채움
		str += gno; // gno 를 넣음
		gvo.setBuy_no(str); // u + 00000 + 1 = u000001
		System.out.println("입력된 gvo : " + gvo);
		model.addAttribute("data", gvo);

		/* 상품정보 */
		model.addAttribute("dlist", gvo.getBuy_list());

		/* 상품이미지 정보 */
		List<BuyListDTO> dtos = gvo.getBuy_list();
		List<ItemVO> volist = new ArrayList<ItemVO>();
		dtos.forEach(i -> {
			i.setBuy_no(gvo.getBuy_no());
			ItemVO ivo = iservice.itemFindById(Integer.parseInt(i.getItem_id()));
			List<AttachFileDTO> afdto = iservice.getAttachList(Integer.parseInt(i.getItem_id()));
			ivo.setAttachList(afdto);
			volist.add(ivo);
		});
		System.out.println("volist: " + volist);
		model.addAttribute("vlist", volist);
	}

	/* 구매 등록 */
	@PostMapping("/register")
	public String registerPost(BuyUserVO bvo, BuyGuestVO gvo, HttpSession session) {
		if (session.getAttribute("user") != null) {

			/* 회원정보가 담겨올때(session 에 user_id 값이 있을때) */
			System.out.println("bvo: " + bvo);

			bservice.insertUserBuy(bvo);
			bvo.getBuy_list().forEach(i -> {
				blistservice.register(i);
			});

		} else {

			/* 비회원정보가 담겨올때 (session 에 user_id 값이 없을때) */
			System.out.println("gvo: " + gvo);

			bservice.insertGuestBuy(gvo);
			gvo.getBuy_list().forEach(i -> {
				blistservice.register(i);
			});

		}

		return "redirect:/buy/buyDone";
	}

	/* 구매완료 페이지 */
	@GetMapping("/buyDone")
	public void success() {
	}

	// 회원 구매내역 조회
	@GetMapping("/mBuyGet")
	public void userBuy(Model model, HttpSession session, String user_id) {
		System.out.println("멤버아이디 잘못됬음?" + user_id);
		List<BuyUserVO> mbList = bservice.bListByUserId(user_id);
		System.out.println(mbList);
		model.addAttribute("mblist", mbList);
		mbList.forEach(i -> {
			System.out.println(i);
		});
	}

	// 관리자권한 전체 구매내역 조회
	@GetMapping("/buyList")
	public void Buy(Model model) {
		List<BuyUserVO> buyList = bservice.userBuyList(); // 전체 회원구매 목록
		List<BuyListDTO> bblist = new ArrayList<BuyListDTO>(); // 아이템 목록만 저장할 공간
		buyList.forEach(i -> {
			List<BuyListDTO> blist = blistservice.listOfNo(i.getBuy_no()); // 주문번호와 일치하는 아이템목록
			blist.forEach(v -> bblist.add(v)); // 아이템 목록만 따로 저장
			i.setBuy_list(blist); // 회원구매목록에 아이템 목록 삽입
		});
		System.out.println(buyList);
		model.addAttribute("buyList", buyList);
		model.addAttribute("bblist", bblist);

	}

}
