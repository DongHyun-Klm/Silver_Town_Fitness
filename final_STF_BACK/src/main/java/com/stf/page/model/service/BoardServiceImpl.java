package com.stf.page.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.BoardDao;
import com.stf.page.model.dto.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao boardDao;
	
	// 글 전체 조회
	@Override
	public List<Board> selectList() {
		return boardDao.selectList();
	}
	
	// 글 등록
	@Override
	public void insertBoard(Board board) {
		boardDao.insertBoard(board);
	}

	// 글 수정
	@Override
	public void updateBoard(Board board) {
		boardDao.updateBoard(board);
	}
	// board + nickname => dto nickboard <= join nick user, board join 

	// 글 삭제
	@Override
	public void deleteBoard(int board_index) {
		boardDao.deleteBoard(board_index) ;
	}

	// 검색 목록
	@Override
	public List<Board> selectSearch(HashMap<String, String> params) {
		return boardDao.selectSearch(params);
	}

	// index에 해당하는 상세 조회
	@Override
	public Board selectOne(int board_index) {
		boardDao.updateViewCnt(board_index);
		return boardDao.selectOne(board_index);
	}
	
	// 업데이트 카운트
	@Override
	public void updateViewCnt(int board_index) {
		Board board = boardDao.selectOne(board_index);
		board.setBoard_cnt(board.getBoard_cnt()+1);
		boardDao.updateBoard(board);
	}
	

}
