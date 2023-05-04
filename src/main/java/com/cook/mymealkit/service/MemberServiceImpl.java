package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.MemberVO;
import com.cook.mymealkit.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService{

	@Setter(onMethod_=@Autowired)
    private MemberMapper membermapper;
	//회원가입
	@Override
	public void join(MemberVO vo){
		membermapper.insertMember(vo);
	}
	//로그인
	@Override
	public boolean login(MemberVO vo,HttpSession session)  {
		String user=membermapper.readmember(vo);
		if(user == null || !user.equals(vo)){
            return false;
        }else {
        	session.setAttribute("id", vo.getId());
        	session.setAttribute("pwd", vo.getPwd());
            return true;
        }
	}
	//회원정보 수정
	@Override
	public void updatemember(MemberVO vo) {
		membermapper.updateMember(vo);
	}
	//회원전체 조회
	@Override
	public List<MemberVO> getAllMembers(MemberVO vo) {
		return membermapper.getAllMembers(vo);
	}
	//회원탈퇴
	@Override
	public void deletemember(MemberVO vo)  {
		membermapper.deleteMember(vo);
	}
	@Override
	public void mypage(MemberVO vo)  {
		membermapper.readmember(vo);
	}
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	@Override
	public MemberVO getWithIdAndPassword(MemberVO vo) {
		System.out.println("vo: " +vo);
		return membermapper.getWithIdAndPassword(vo);
	}
}
