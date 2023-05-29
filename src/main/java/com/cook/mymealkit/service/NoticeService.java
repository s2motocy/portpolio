package com.cook.mymealkit.service;

import java.util.List;

import com.cook.mymealkit.domain.NoticeVO;

public interface NoticeService {
    public List<NoticeVO> getPostList();// 게시글 목록 조회

    public NoticeVO getPostById(NoticeVO vo);// 게시글 내용조회

    public void createPost(NoticeVO vo);// 게시글 등록

    public int updatePost(NoticeVO vo);// 게시글 업데이트

    public void deletePost(NoticeVO vo);// 게시글 삭제
}
