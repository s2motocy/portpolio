package com.cook.mymealkit.service;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.MemberVO;
import com.cook.mymealkit.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
    private MemberMapper membermapper;
	//회원가입
	@Override
	public void join(MemberVO vo) throws Exception {
		membermapper.insertMember(vo);
	}
	//로그인
	@Override
	public boolean login(MemberVO vo) throws Exception {
		System.out.println(" service에서 login: " +vo);
		MemberVO user=membermapper.readmember(vo);
		System.out.println(user);
		if(user == null){
            return false;
        }else {
            return true;
        }
	}
	//회원정보 수정
	@Override
	public void updatemember(MemberVO vo) throws Exception {
		membermapper.updateMember(vo);
	}
	//회원전체 조회
	@Override
	public List<MemberVO> getAllMembers() {
		return membermapper.getAllMembers();
	}
	//회원탈퇴
	@Override
	public void deletemember(MemberVO vo) throws Exception {
		membermapper.deleteMember(vo);
	}
	//마이페이지
	@Override
	public MemberVO mypage(MemberVO vo) throws Exception {
		return membermapper.readmember(vo);
	}
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
}