package com.cook.mymealkit.service;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
    private UserMapper umapper;
	//회원가입
	@Override
	public void join(UserVO vo) throws Exception {
		umapper.insertUser(vo);
	}
	//로그인
	@Override
	public boolean login(UserVO vo){
		System.out.println(" service에서 login: " +vo);
		UserVO user=umapper.readUser(vo);
		System.out.println(user);
		if(user == null){
            return false;
        }else {
            return true;
        }
	}
	//회원정보 수정
	@Override
	public void updateUser(UserVO vo) throws Exception {
		umapper.updateUser(vo);
	}
	//회원전체 조회
	@Override
	public List<UserVO> getAllUser() {
		return umapper.getAllUser();
	}
	//회원탈퇴
	@Override
	public void deleteUser(UserVO vo) throws Exception {
		umapper.deleteUser(vo);
	}
	//마이페이지
	@Override
	public UserVO mypage(UserVO vo) throws Exception {
		return umapper.readUser(vo);
	}
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}
	//아이디 중복체크
	@Override
	public String idCheck(String id) {
		List<UserVO> vo = umapper.idCheck(id);
		System.out.println(vo);
		if (vo.size()==0) {
			return "0";
		}
		System.out.println("서비스에서 vo :" +vo);
		return vo.get(0).getUser_id();
	}
	//아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {
		return umapper.findId(vo);
	}
	//비밀번호 찾기
	@Override
	public UserVO findPassword(UserVO vo) {
		return umapper.findpwd(vo);
	}
	//비밀번호 변경
	@Override
	public void updatePassword(UserVO vo) {
		System.out.println("서비스: vo " +vo);
		umapper.updatepwd(vo);
	}
	@Override
	public UserVO getUserById(String user_id) {
		return umapper.UserById(user_id);
	}
}
