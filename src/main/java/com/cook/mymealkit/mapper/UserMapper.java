package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.UserVO;

@Mapper
public interface UserMapper {
	
	public void insertUser(UserVO vo); //회원가입
	public int idCheck(String user_id); // ID중복체크
	public UserVO readUser(UserVO vo); //로그인
	public List<UserVO> getAllUsers();//관리자 회원정보 전체 조회
	public void updateUser(UserVO vo);//회원 정보 업데이트
	public void deleteUser(UserVO vo);//회원 탈퇴
	public void logout(String userId);
	public UserVO getUserById(String userId);
	
}
