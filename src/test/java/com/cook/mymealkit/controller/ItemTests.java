package com.cook.mymealkit.controller;

import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cook.mymealkit.domain.ItemVO;
import com.cook.mymealkit.mapper.CartMapper;
import com.cook.mymealkit.mapper.ItemMapper;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ItemTests {
	
	@Setter(onMethod_=@Autowired)
	private ItemMapper imapper;
	@Setter(onMethod_=@Autowired)
	private CartMapper cmapper;
	
	
	/* 더미데이터 10개 입력 */
//	@Test
	public void insert_dummy_test() {
		for(int i=0;i<10;i++) {
			ItemVO vo = new ItemVO();
			vo.setCategory("korean food");
			vo.setItem_name("item"+((int)Math.random()*10));
			vo.setItem_price((i+1)*1000);
			vo.setDescription("description"+i);
			imapper.itemInsert(vo);
		}
	}
	
	/* item_id 로 조회 */
//	@Test
	public void service_test() {
		long item_id = 1;
		ItemVO vo = imapper.itemFindById(item_id);
		System.out.println("===================");
		System.out.println(vo);
		System.out.println("===================");
	}
	
	/* 상품정보 수정 */
//	@Test
	public void updateTest() {
		ItemVO vo = new ItemVO();
		vo.setItem_id(6L);
		vo.setCategory("japanese food");
		vo.setItem_name("modified name");
		vo.setItem_price(300000);
		vo.setDescription("tlqklskldfbnsdfhiofga");
		imapper.itemUpdate(vo);
	}

}
