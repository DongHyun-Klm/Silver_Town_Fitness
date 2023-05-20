package com.stf.page.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;import org.springframework.web.jsf.FacesContextUtils;
import org.springframework.web.multipart.MultipartFile;

import com.stf.page.model.dto.User;
import com.stf.page.model.service.UserService;
import com.stf.page.util.JwtUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "유저 컨트롤러")
public class UserRestController {

	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private UserService userService;

	//파일 저장할 경로
	final private String filedir = "C:/Users/김동현/Dropbox/STF/BSG_Silver_Town_Fitness/image/";
	
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
	public ResponseEntity<?> signup(User user, @RequestParam(value = "profileImage", required = false) MultipartFile file) throws IllegalStateException, IOException{
		String fullpath = "";
		if(!file.isEmpty()) {
			fullpath = filedir + System.currentTimeMillis() + "_" + file.getOriginalFilename();
			file.transferTo(new File(fullpath));
			user.setUser_img(fullpath);
		}
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
	public ResponseEntity<?> delete(@RequestHeader("access-token") String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		userService.deleteUser(user_id); 
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//마이페이지
	@GetMapping("/user/mypage")
	public ResponseEntity<User> myPage(@RequestHeader("access-token") String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		return new ResponseEntity<User>(userService.selectOne(user_id), HttpStatus.OK);
	}
}
