package com.stf.page.model.dao;

import java.util.HashMap;
import java.util.List;

import com.stf.page.model.dto.Board;

// 게시판과 관련된 쿼리를 처리합니다.
public interface BoardDao {
	
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

	
}
