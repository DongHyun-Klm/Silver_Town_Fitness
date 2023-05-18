package com.stf.page.model.service;

import java.util.HashMap;
import java.util.List;

import com.stf.page.model.dto.Board;

public interface BoardService {
	//게시글 등록
	void writeBoard(Board board);
	//게시글 목록
	List<Board> getBoardList(HashMap<String, String> params);
	//게시글 조회
	Board getBoard(int id);
	//게시글 수정
	boolean modifyBoard(Board board);
	//게시글 삭제
	boolean removeBoard(int id);
	//게시글 view cnt 증가
	void updateViewCnt(int id);
}
