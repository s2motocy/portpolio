package com.cook.mymealkit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cook.mymealkit.domain.MemberVO;

@Mapper
public interface MemberMapper {
	public void insertMember(MemberVO vo); //회원가입
	public MemberVO readmember(MemberVO vo); //로그인
	public List<MemberVO> getAllMembers();//관리자 회원정보 전체 조회
	public void updateMember(MemberVO vo);//회원 정보 업데이트
	public void deleteMember(MemberVO vo);//회원 탈퇴
	public void logout(String userId);
}
