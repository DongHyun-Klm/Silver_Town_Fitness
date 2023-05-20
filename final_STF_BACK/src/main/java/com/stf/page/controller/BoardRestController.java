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
import com.stf.page.model.dto.Notice;
import com.stf.page.model.dto.Teacher_review;
import com.stf.page.model.service.BoardService;
import com.stf.page.model.service.NoticeService;
import com.stf.page.model.service.ReviewService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "게시판 컨트롤러")
public class BoardRestController {

	private static final String SUCCESS = "succes";
	private static final String FAIL = "fail";

	@Autowired
	private BoardService boardService;

	// 사랑방 글 전체 조회
	@GetMapping("/board")
	public ResponseEntity<List<Board>> love_All() {
		List<Board> list = boardService.selectList(); // 단순히 전제 조회
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 사랑방 글 등록
	@PostMapping("/board")
	public ResponseEntity<Board> love_create(Board board) {
		boardService.insertBoard(board);

		return new ResponseEntity<>(board, HttpStatus.OK);

	}

	// 사랑방 글 수정
	@PutMapping("/board")
	public ResponseEntity<Void> love_modify(@RequestBody Board board) {
		boardService.updateBoard(board);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 사랑방 글 삭제
	@DeleteMapping("/board/{board_index}")
	public ResponseEntity<?> love_delete(@PathVariable int board_index) {

		int result = boardService.deleteBoard(board_index);

		if (result != 0) {
			return new ResponseEntity<Integer>(result, HttpStatus.OK);
		} else {
			return new ResponseEntity<Integer>(HttpStatus.NOT_FOUND);
		}
	}	
	
	// 사랑방 상세 조회
	@GetMapping("/board/{board_index}")
	public ResponseEntity<Board> love_detail(@PathVariable int board_index){
		Board result = boardService.selectOne(board_index);

		return new ResponseEntity<Board>(result, HttpStatus.OK);
	}
	
	// 샤랑방 글 검색
//	@GetMapping("/board/search/{type}&{keyword}")
//	public ResponseEntity<List<Board>> search()
//	//List<Board> selectSearch(HashMap<String, String> params);

	// 게시글 view cnt 증가 =>> 이건 front에서 처리하지 않나?
	
	@Autowired
	private NoticeService noticeService;
	
	// 공지사항 조회 /notice
	@GetMapping("/notice")
	public ResponseEntity<List<Notice>> notice_All() {
		List<Notice> list = noticeService.selectList(); // 단순히 전제 조회
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 공지사항 상세조회 /notice/{index}
	@GetMapping("/notice/{notice_index}")
	public ResponseEntity<Board> notice_detail(@PathVariable int notice_index){
		Board result = boardService.selectOne(notice_index);

		return new ResponseEntity<Board>(result, HttpStatus.OK);
	}
	
	
	@Autowired
	private ReviewService reviewService;
	
	// 강사별 리뷰 조회 /review
	@GetMapping("/review")
	public ResponseEntity<List<Teacher_review>> teacher_reviewList(){
		List<Teacher_review> list = reviewService.selectList(); // 단순히 전제 조회
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 강사별 리뷰 작성 /review
	@PostMapping("/review")
	public ResponseEntity<Teacher_review> teacher_reviewCreate(Teacher_review review) {
		reviewService.insertBoard(review);

		return new ResponseEntity<>(review, HttpStatus.OK);

	}
}

