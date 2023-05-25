package com.stf.page.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.file.Paths;
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
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.stf.page.model.dto.Board;
import com.stf.page.model.dto.Notice;
import com.stf.page.model.dto.Teacher_review;
import com.stf.page.model.service.BoardService;
import com.stf.page.model.service.NoticeService;
import com.stf.page.model.service.ReviewService;
import com.stf.page.util.JwtUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureException;
import io.jsonwebtoken.UnsupportedJwtException;
import io.swagger.annotations.Api;

@RestController
@RequestMapping("/api")
@Api(tags = "게시판 컨트롤러")
public class BoardRestController {

	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private BoardService boardService;
	//파일 저장할 경로


	final private String filedir = "C:/Users/SSAFY/Dropbox/Seong/Final/BSG_Silver_Town_Fitness/final_STF_FRONT/src/assets/upload/";

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
	public ResponseEntity<Board> love_create(@RequestHeader("access-token") String token, Board board, @RequestParam(value = "file", required = false) MultipartFile file) throws IllegalStateException, IOException {
		// 파일 업로드
		if(file != null) {
			String fullpath = "";
			String oimg = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			fullpath = filedir + oimg;
			file.transferTo(new File(fullpath));
			board.setBoard_img(oimg);
		}
		System.out.println("--------------------------");
		System.out.println(board);
		// token에서 유저 id 가져오기
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		board.setUser_id(user_id);
		boardService.insertBoard(board);

		return new ResponseEntity<>(board, HttpStatus.OK);
	}

	// 사랑방 글 수정
	@PutMapping("/board")
	public ResponseEntity<Void> love_modify(@RequestBody Board board, @RequestParam(value = "file", required = false) MultipartFile file) throws IllegalStateException, IOException {
		// 파일 업로드
		if(file!=null) {
			String fullpath = "";
			String oimg = System.currentTimeMillis() + "_" + file.getOriginalFilename();
			fullpath = filedir + oimg;
			file.transferTo(new File(fullpath));
			board.setBoard_img(oimg);
		}
		boardService.updateBoard(board);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	// 사랑방 글 삭제
	@DeleteMapping("/board/{board_index}")
	public ResponseEntity<Void> love_delete(@RequestHeader("access-token") String token, @PathVariable int board_index) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException {
		System.out.println(board_index);
		System.out.println(token);
		// 토큰에서 가져온 유저 id
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		// 삭제하려는 글의 유저 id
		String board_user_id = boardService.selectOne(board_index).getUser_id();
		// 다르다면 삭제 불가
		if(!user_id.equals(board_user_id)) {
			return new ResponseEntity<Void>(HttpStatus.FORBIDDEN);
		}
		boardService.deleteBoard(board_index);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}	
	
	// 사랑방 상세 조회
	@GetMapping("/board/{board_index}")
	public ResponseEntity<Board> love_detail(@PathVariable int board_index){
		Board result = boardService.selectOne(board_index);

		return new ResponseEntity<Board>(result, HttpStatus.OK);
	}
	
	// 사랑방 게시판 검색 // vue에서 처리
	@GetMapping("/board/search")
	public ResponseEntity<List<Board>> list(@RequestParam String type, @RequestParam String keyword) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("type", type);
		params.put("keyword", keyword);
		return new ResponseEntity<List<Board>>(boardService.selectSearch(params), HttpStatus.OK);
	}

	
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
	public ResponseEntity<Notice> notice_detail(@PathVariable int notice_index){
		Notice result = noticeService.selectOne(notice_index);
		result.setNotice_cnt(result.getNotice_cnt()+1);
		return new ResponseEntity<Notice>(result, HttpStatus.OK);
	}
	
	
	@Autowired
	private ReviewService reviewService;
	
	// 종목별 강사 리뷰 조회 /review/{index}
	@GetMapping("/review/{excercise_index}")
	public ResponseEntity<List<Teacher_review>> teacher_reviewList(@PathVariable int excercise_index){
		List<Teacher_review> list = reviewService.selectList(excercise_index); // 단순히 전제 조회
		if (list == null || list.size() == 0) {
			return new ResponseEntity<>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	// 강사별 리뷰 작성 /review
	@PostMapping("/review")	
	public ResponseEntity<Teacher_review> teacher_reviewCreate(@RequestHeader("access-token") String token, @RequestBody Teacher_review review) throws ExpiredJwtException, UnsupportedJwtException, MalformedJwtException, SignatureException, IllegalArgumentException, UnsupportedEncodingException {
		System.out.println(review);
		// token에서 유저 id 가져오기
		String user_id = (String) jwtUtil.parseToken(token).get("id");
		review.setUser_id(user_id);	
		reviewService.insertBoard(review);
		return new ResponseEntity<>(review, HttpStatus.OK);
	}
}

