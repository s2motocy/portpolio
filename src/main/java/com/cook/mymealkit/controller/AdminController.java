package com.cook.mymealkit.controller;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cook.mymealkit.domain.ChartVO;
import com.cook.mymealkit.mapper.AdminMapper;

import lombok.Setter;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	AdminMapper amapper;

	@GetMapping("/adminPage")
	public void admin() {
	};

	@GetMapping("/dashboard")
	public String showChart(Model model) throws ParseException {
		// 일일 회원가입자 수
		ChartVO vo = new ChartVO();
		vo.setStartDate("");
		vo.setEndDate("");
		List<ChartVO> userData = amapper.getUserCountByRegDate(vo);

		List<ChartVO> list = new ArrayList<>();

		for (ChartVO data : userData) {
			ChartVO a = new ChartVO();
			a.setCnt(data.getCnt());
			a.setReg_date(data.getReg_date().substring(0, 10));
			a.setStartDate(vo.getStartDate());
			a.setEndDate(vo.getEndDate());
			list.add(a);
		}
		// 일일 판매량 수
		vo.setStartDateB("");
		vo.setEndDateB("");
		List<ChartVO> userbuyData = amapper.getUserBuyCountByBuyDate(vo);

		List<ChartVO> ublist = new ArrayList<>();

		for (ChartVO ubdata : userbuyData) {
			ChartVO b = new ChartVO();
			b.setStartDateB(ubdata.getStartDateB());
			b.setEndDateB(ubdata.getEndDateB());
			b.setBuyCnt(ubdata.getBuyCnt());
			b.setBuy_date(ubdata.getBuy_date().substring(0, 10));
			ublist.add(b);
		}
		// 모델에 데이터 추가
		model.addAttribute("list", list);
		model.addAttribute("ublist", ublist);
		return "/admin/dashboard";
	}

	@GetMapping("/userChart")
	@ResponseBody
	public List<ChartVO> chartgogo(ChartVO vo) {
		List<ChartVO> userData = amapper.getUserCountByRegDate(vo);

		List<ChartVO> list = new ArrayList<>();

		for (ChartVO data : userData) {
			ChartVO a = new ChartVO();
			a.setCnt(data.getCnt());
			a.setReg_date(data.getReg_date().substring(0, 10));
			list.add(a);
		}

		return list;
	}

	@GetMapping("/useBuyChart")
	@ResponseBody
	public List<ChartVO> ubChartgogo(ChartVO vo) {
		List<ChartVO> userData = amapper.getUserBuyCountByBuyDate(vo);
		List<ChartVO> ublist = new ArrayList<>();

		for (ChartVO data : userData) {
			ChartVO b = new ChartVO();
			b.setBuyCnt(data.getBuyCnt());
			b.setBuy_date(data.getBuy_date().substring(0, 10));
			ublist.add(b);
		}
		return ublist;
	}
}
