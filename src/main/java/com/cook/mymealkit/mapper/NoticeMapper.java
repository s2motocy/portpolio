package com.cook.mymealkit.mapper;

import java.util.List;

import com.cook.mymealkit.domain.NoticeVO;

public interface NoticeMapper {
	public List<NoticeVO> selectAll();//게시글 목록 조회
    public NoticeVO selectById(NoticeVO vo);//게시글 내용 조회
    public void insert(NoticeVO vo);//게시글 입력
    public int update(NoticeVO vo);//게시글 업데이트
    public void deleteById(NoticeVO vo);//게시글 삭제
}
