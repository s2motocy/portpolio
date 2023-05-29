package com.cook.mymealkit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.NoticeVO;
import com.cook.mymealkit.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeMapper boardmapper;

	// 게시글 목록 조회 서비스
	@Override
	public List<NoticeVO> getPostList() {
		List<NoticeVO> list = boardmapper.selectAll();
		System.out.println("서비스:" + list);
		return list;
	}

	// 게시글 내용 조회 서비스
	@Override
	public NoticeVO getPostById(NoticeVO vo) {
		return boardmapper.selectById(vo);
	}

	// 게시글 등록 서비스
	@Override
	public void createPost(NoticeVO vo) {
		boardmapper.insert(vo);
	}

	// 게시글 삭제 서비스
	@Override
	public void deletePost(NoticeVO vo) {
		boardmapper.deleteById(vo);
	}

	// 게시글 업데이트 서비스
	@Override
	public int updatePost(NoticeVO vo) {
		return boardmapper.update(vo);
	}

}
