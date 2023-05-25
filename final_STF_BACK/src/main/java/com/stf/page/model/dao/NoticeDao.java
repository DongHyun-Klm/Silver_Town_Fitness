package com.stf.page.model.dao;

import java.util.List;

import com.stf.page.model.dto.Notice;

// 공지 사항과 관련된 쿼리를 처리합니다.
public interface NoticeDao {
	
	// 공지사항 조회
	List<Notice> selectList();
	
	// 공지사항 글 상세 조회
	Notice selectOne(int notice_index);
	

}
