package com.cook.mymealkit.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cook.mymealkit.domain.UserVO;
import com.cook.mymealkit.mapper.UserMapper;

import lombok.Setter;

@Service
public class UserServiceImpl implements UserService{

	@Setter(onMethod_=@Autowired)
    private UserMapper umapper;
	//회원가입
	
	@Override
	public void join(UserVO vo) {
		System.out.println("User 서비스에서 가입 : vo="+ vo);
		umapper.insertUser(vo);
	}
	
	//로그인
	@Override
	public boolean login(UserVO vo) {
		System.out.println("User 서비스에서 로그인 : vo=" +vo);
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
	public void updateUser(UserVO vo) {
		System.out.println("User 서비스에서 수정 : vo="+ vo);
		umapper.updateUser(vo);
	}
	
	//회원전체 조회
	@Override
	public List<UserVO> getAllUsers() {
		System.out.println("User 서비스에서 목록 : ");
		return umapper.getAllUsers();
	}
	
	//회원탈퇴
	@Override
	public void deleteUser(UserVO vo) {
		System.out.println("User 서비스에서 삭제 : vo="+ vo);
		umapper.deleteUser(vo);
	}
	
	//마이페이지
	@Override
	public UserVO mypage(UserVO vo) {
		System.out.println("User 서비스에서 조회 : vo="+ vo);
		return umapper.readUser(vo);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) {
		System.out.println("User 서비스에서 로그아웃 : ");
		session.invalidate();
	}
	
	@Override
	public UserVO getUserById(String user_id) {
		System.out.println("User 서비스에서 userid로 조회 : user_id="+ user_id);
		return umapper.getUserById(user_id);
	}
	
	@Override
	public int idCheck(String user_id) {
		System.out.println("User 서비스에서 user_id 로 중복체크: user_id="+ user_id);
		return umapper.idCheck(user_id);
	}
}