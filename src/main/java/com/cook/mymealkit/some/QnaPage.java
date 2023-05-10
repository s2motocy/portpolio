package com.cook.mymealkit.some;

import org.springframework.stereotype.Component;
import java.util.List;
import com.cook.mymealkit.domain.PageVO;
import com.cook.mymealkit.domain.QnaVO;

import lombok.Data;
@Data
@Component
public class QnaPage extends PageVO{
	private List<QnaVO> list;
	
	public List<QnaVO> getList(){
		return list;
	}
	
	public void setList(List<QnaVO>list) {
		this.list = list;
	}

}
