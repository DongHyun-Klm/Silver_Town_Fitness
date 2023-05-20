package com.stf.page.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.UserDao;
import com.stf.page.model.dto.User;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public int login(String id, String password) {
		User tmp = userDao.selectOne(id);
		// 존재하지 않는 아이디 => 1반환
		if(tmp==null) return 1;
		// 비밀번호가 다름 => 2반환
		else if(!tmp.getUser_password().equals(password)) return 2;
		else return 0; // 0 => 로그인 성공
	}

	@Override
	public void signup(User user) {
		userDao.insertUser(user);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public void deleteUser(String id) {
		userDao.deleteUser(id);
	}

	@Override
	public User selectOne(String id) {
		return userDao.selectOne(id);
	}

	@Override
	public boolean dupliChk(String id) {
		User temp = userDao.selectOne(id);
		if(temp == null) return false;
		return true;
	}
		
}
