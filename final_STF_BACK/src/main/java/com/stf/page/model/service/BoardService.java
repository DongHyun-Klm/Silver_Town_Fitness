package com.stf.page.model.service;

import java.util.HashMap;
import java.util.List;

import com.stf.page.model.dto.Board;

public interface BoardService {
	
	// 사랑방 글 전체 조회
	List<Board> selectList();
	
	// 사랑방 글 등록
	void insertBoard(Board board);
	
	// 사랑방 글 수정
	void updateBoard(Board board);
	
	// 사랑방 글 삭제
	void deleteBoard(Board index);
	
	// 사랑방 글 검색
	List<Board> selectSearch(HashMap<String, String> params);
		
	// 사랑방 상세 조회
	Board selectOne(int index);
	
	//게시글 view cnt 증가
	void updateViewCnt(int index);

	
}
