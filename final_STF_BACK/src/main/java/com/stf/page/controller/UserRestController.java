package com.stf.page.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;import org.springframework.web.jsf.FacesContextUtils;

import com.stf.page.model.dto.User;
import com.stf.page.model.service.UserService;
import com.stf.page.util.JwtUtil;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "유저 컨트롤러")
public class UserRestController {

	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private UserService userService;
	
	//로그인
	@PostMapping("/user/login")
	public ResponseEntity<Map<String, Object>> login(User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		HttpStatus status = null;
		// 로그인 결과 확인
		int check = -1;
		check = userService.login(user.getUser_id(), user.getUser_password());
		// 아이디가 존재하지 않는 경우(check => 1)
		if(check == 1) {
			result.put("message", "존재하지 않는 아이디입니다.");
			status = HttpStatus.NO_CONTENT;
		}
		// 비밀번호가 틀린 경우(check => 2)
		else if(check == 2) {
			result.put("message", "비밀번호가 틀렸습니다.");
			status = HttpStatus.NO_CONTENT;
		}
		// 로그인 성공(check => 0)
		else if(check == 0){
			try {
				result.put("access-token", jwtUtil.createToken("id", user.getUser_id()));
				result.put("message", "로그인 성공!");
				status = HttpStatus.ACCEPTED;
			} catch (UnsupportedEncodingException e) {
				result.put("message", "서버 오류");
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		}
		return new ResponseEntity<Map<String,Object>>(result, status);
	}
	
	//회원가입
	@PostMapping("/user/signup")
	public ResponseEntity<?> signup(User user){
//		// 아이디가 이미 있다면
//		if(userService.dupliChk(user.getUser_id())) 
//			return new ResponseEntity<String>("아이디가 이미 존재합니다.", HttpStatus.CONFLICT);
		userService.signup(user);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//아이디 중복검사
	@PostMapping("/user/signup/chk")
	public ResponseEntity<?> dupChk(String user_name){
		// 아이디가 이미 있다면
		if(userService.dupliChk(user_name)) 
			return new ResponseEntity<String>("아이디가 이미 존재합니다.", HttpStatus.CONFLICT);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//회원 정보수정
	@PutMapping("/user")
	public ResponseEntity<?> update(User user){
		user.setUser_index(userService.selectOne(user.getUser_id()).getUser_index());
		userService.updateUser(user);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//회원 삭제
	@DeleteMapping("/user")
	public ResponseEntity<?> delete(String user_id){
		userService.deleteUser(user_id);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//마이페이지
	@GetMapping("/user/{id}")
	public ResponseEntity<User> myPage(@PathVariable String id){
		return new ResponseEntity<User>(userService.selectOne(id), HttpStatus.OK);
	}
}
