package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.UserVO;

@Mapper
public interface UserMapper {
	public void insertUser(UserVO vo);				// 회원가입
	public int idCheck(String user_id);				// 아이디 중복체크

	public UserVO readUser(UserVO vo);				// 로그인
	public UserVO findId(UserVO vo);				// 아이디 찾기
	public UserVO findpwd(UserVO vo);				// 비밀번호 찾기
	public void updatepwd(UserVO vo);				// 비밀번호 변경
	
	public void logout(String userId);				// 로그아웃
	public void updateUser(UserVO vo);				// 회원 정보 수정
	public void deleteUser(UserVO vo);				// 회원 탈퇴

	public List<UserVO> getAllUser();				// 관리자 회원정보 전체 조회	
	public int userDelete(long uno);				// 관리자 권한 회원정보 삭제

	public UserVO UserById(String user_id);
	
}
