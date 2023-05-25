package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Notice;

public interface NoticeService{

	// 공지사항 조회
	List<Notice> selectList();
	
	// 공지사항 글 상세 조회
	Notice selectOne(int notice_index);
	
	
}
