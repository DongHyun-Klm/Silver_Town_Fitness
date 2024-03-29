package com.stf.page.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.stf.page.model.dto.Regist;
import com.stf.page.model.dto.Reservation;
import com.stf.page.model.service.LectureService;
import com.stf.page.model.service.ReservationService;
import com.stf.page.util.JwtUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "예약 컨트롤러")
public class ReservationController {

	@Autowired
	private JwtUtil jwtUtil;

	@Autowired
	private ReservationService Rservice;
	
	@Autowired
	private LectureService Lservice;

	// 예약목록 조회
	@GetMapping("/reservation/regist")
	public ResponseEntity<List<Reservation>> selectRList(@RequestHeader("access-token") String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		List<Reservation> list = Rservice.selectRList(user_id);
		return new ResponseEntity<List<Reservation>>(list, HttpStatus.OK);
	}
	
	// 이수중목록 조회
	@GetMapping("/reservation")
	public ResponseEntity<List<Reservation>> selectList(@RequestHeader("access-token") String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		List<Reservation> list = Rservice.selectList(user_id);
		return new ResponseEntity<List<Reservation>>(list, HttpStatus.OK);
	}

	// 이수목록 조회
	@GetMapping("/reservation/done")
	public ResponseEntity<List<Reservation>> selectDList(@RequestHeader("access-token") String token) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		List<Reservation> list = Rservice.selectDList(user_id);
		return new ResponseEntity<List<Reservation>>(list, HttpStatus.OK);
	}

	// 수강신청
	@PostMapping("/reservation/{lecture_index}")
	public ResponseEntity<Void> insertReservation(@RequestHeader("access-token") String token, @PathVariable int lecture_index) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException{
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		Regist temp = new Regist(0, user_id, lecture_index);
		Lservice.update_cnt(lecture_index);
		Rservice.insertReservation(temp);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// 수강신청 삭제
	@DeleteMapping("/reservation")
	public ResponseEntity<Void> deleteReservation(int reservation_index, int lecture_index) {
		System.out.println(lecture_index);
		Lservice.update_cnt2(lecture_index);
		Rservice.deleteReservation(reservation_index);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
