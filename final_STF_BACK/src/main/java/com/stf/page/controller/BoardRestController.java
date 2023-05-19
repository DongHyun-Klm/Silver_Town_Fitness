package com.stf.page.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.stf.page.model.dto.Board;
import com.stf.page.model.service.BoardService;


@RestController
@RequestMapping("/api")
public class BoardRestController {

	private static final String SUCCESS = "succes";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService boardService;

	//사랑방 글 전체 조회
	@GetMapping
	public ResponseEntity<List<Board>> searchAll() {
		return new ResponseEntity<>(boardService.selectList(), HttpStatus.OK);
	}
	
	// 사랑방 글 등록
	@PostMapping
	public ResponseEntity<String> create(@RequestBody Board board) {
		boardService.insertBoard(board);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);
		
	}
	
	// 사랑방 글 수정
	@PutMapping("{index}")
	public ResponseEntity<String> modify(@RequestBody Board board) {
		boardService.updateBoard(board);
		return new ResponseEntity<String>(SUCCESS, HttpStatus.OK);		
	}
	
	// 사랑방 글 삭제

//	@DeleteMapping("/board/{index}")
//	public ResponseEntity<?> delete(@PathVariable Board index) {
//		try {
//			int car_delete = boardService.deleteBoard(index);
//			if (car_delete != 0) {
//				return new ResponseEntity<Integer>(car_delete, HttpStatus.OK);
//			} else {
//				return new ResponseEntity<Integer>(HttpStatus.NOT_FOUND);
//			}
//		} catch (Exception e) {
//			return exceptionHandling(e);
//		}
//
//	}
	
}

	
	
	
	// 사랑방 글 검색
		
	// 사랑방 상세 조회
	
	//게시글 view cnt 증가
