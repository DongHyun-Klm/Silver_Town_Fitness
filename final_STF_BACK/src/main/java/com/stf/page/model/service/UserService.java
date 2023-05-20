package com.stf.page.model.service;

import com.stf.page.model.dto.User;

public interface UserService {
		// 로그인
		public int login(String id, String password);
		
		// 회원가입
		public void signup(User user);
		
		// 회원정보 수정
		public void updateUser(User user);
		
		// 회원 탈퇴
		public void deleteUser(String id);
		
		// 마이페이지 조회
		public User selectOne(String id);
		
		// 아이디 중복검사
		public boolean dupliChk(String id);
}
