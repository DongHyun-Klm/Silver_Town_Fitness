package com.stf.page.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/user/login")
	public ResponseEntity<Map<String, Object>> login(User user) {
		System.out.println(user);
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
	
	
}
