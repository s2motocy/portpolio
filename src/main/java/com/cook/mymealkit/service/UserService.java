package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.cook.mymealkit.domain.UserVO;

public interface UserService {
	public void join(UserVO vo);				// 회원가입

	public boolean login(UserVO vo);			// 로그인

	public void updateUser(UserVO vo);			// 회원수정

	public List<UserVO> getAllUser();			// 관리자 권한 회원목록 전체 조회

	public void deleteUser(UserVO vo);			// 회원탈퇴

	public UserVO mypage(UserVO vo);			// 마이페이지
	
	public int userDelete(long uno);			// 관리자 권한 회원정보 삭제

	public void logout(HttpSession session);	// 로그아웃

	public String idCheck(String id);			// 아이디 중복체크

	public UserVO findId(UserVO vo);			// 아이디 찾기

	public UserVO findPassword(UserVO vo);		// 비밀번호 찾기

	public void updatePassword(UserVO vo);		// 비밀번호 수정

	public UserVO getUserById(String user_id);
}
