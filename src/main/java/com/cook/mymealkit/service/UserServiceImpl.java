package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper umapper;
	
	// 회원가입
	@Override
	public void join(UserVO vo) {
		umapper.insertUser(vo);
	}

	// 로그인
	@Override
	public boolean login(UserVO vo) {
		System.out.println(" service에서 login: " + vo);
		UserVO user = umapper.readUser(vo);
		System.out.println(user);
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	// 회원정보 수정
	@Override
	public void updateUser(UserVO vo) {
		umapper.updateUser(vo);
	}

	// 회원전체 조회
	@Override
	public List<UserVO> getAllUser() {
		return umapper.getAllUser();
	}

	// 회원탈퇴
	@Override
	public void deleteUser(UserVO vo) {
		umapper.deleteUser(vo);
	}

	// 마이페이지
	@Override
	public UserVO mypage(UserVO vo) {
		return umapper.readUser(vo);
	}

	// 로그아웃
	@Override
	public void logout(HttpSession session) {
		session.invalidate();
	}

	// 아이디 중복체크
	@Override
	public int idCheck(String user_id) {
		System.out.println("서비스에서 : " +user_id);
		return umapper.idCheck(user_id);
	}

	// 아이디 찾기
	@Override
	public UserVO findId(UserVO vo) {
		return umapper.findId(vo);
	}

	// 비밀번호 찾기
	@Override
	public UserVO findPassword(UserVO vo) {
		return umapper.findpwd(vo);
	}

	// 비밀번호 변경
	@Override
	public void updatePassword(UserVO vo) {
		System.out.println("서비스: vo " + vo);
		umapper.updatepwd(vo);
	}

	@Override
	public UserVO getUserById(String user_id) {
		int result =umapper.idCheck(user_id);
		System.out.println("서비스에서 result : " +result);
		return umapper.UserById(user_id);
	}

	@Override
	public int userDelete(long uno) {
		System.out.println("삭제 확인" + uno);
		return umapper.userDelete(uno);
	}
}
