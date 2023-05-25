package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.cook.mymealkit.domain.UserVO;

import lombok.Getter;
import lombok.Setter;

@Mapper
public interface UserMapper {
	public void insertUser(UserVO vo); //회원가입
	public UserVO readUser(UserVO vo); //로그인
	public List<UserVO> getAllUser();//관리자 회원정보 전체 조회
	public void updateUser(UserVO vo);//회원 정보 업데이트
	public void deleteUser(UserVO vo);//회원 탈퇴
	public void logout(String userId);//로그아웃
	public List<UserVO> idCheck(String user_id);//아이디 중복체크
	public UserVO findId(UserVO vo);//아이디 찾기
	public UserVO findpwd(UserVO vo);//비밀번호 찾기
	public void updatepwd(UserVO vo);//비밀번호 변경
	public UserVO UserById(String user_id);
}
