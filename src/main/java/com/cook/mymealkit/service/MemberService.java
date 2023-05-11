package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.cook.mymealkit.domain.MemberVO;

public interface MemberService {
	public void join(MemberVO vo) throws Exception;//회원가입
	public boolean login(MemberVO vo) throws Exception;//로그인
	public void updatemember(MemberVO vo) throws Exception;//회원수정
	public List<MemberVO> getAllMembers();//회원목록 전체 조회
	public void deletemember(MemberVO vo)throws Exception;//회원탈퇴
	public MemberVO mypage(MemberVO vo)throws Exception;//마이페이지
	public void logout(HttpSession session);//로그아웃
}
