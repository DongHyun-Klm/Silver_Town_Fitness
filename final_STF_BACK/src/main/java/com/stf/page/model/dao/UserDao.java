package com.stf.page.model.dao;

import com.stf.page.model.dto.User;

// 사용자 계정과 관련된 쿼리를 처리합니다.
public interface UserDao {

	// 로그인
	
	
	// 마이페이지 조회
	public User selectOne(String id);
	
	// 회원가입
	public void insertUser(User user);
	
	// 회원정보 수정
	public void updateUser(User user);
	
	// 회원 탈퇴
	public void deleteUser(String id);
	

	
}
