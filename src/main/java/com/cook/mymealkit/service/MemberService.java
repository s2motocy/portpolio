package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.cook.mymealkit.domain.MemberVO;

public interface MemberService {
	public void join(MemberVO vo) ;
	public boolean login(MemberVO vo,HttpSession session) ;
	public void updatemember(MemberVO vo) ;
	public List<MemberVO> getAllMembers(MemberVO vo);
	public void deletemember(MemberVO vo);
	public void mypage(MemberVO vo);
	public void logout(HttpSession session);
	public MemberVO getWithIdAndPassword(MemberVO vo);
}
