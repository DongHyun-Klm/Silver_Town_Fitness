package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.NoticeDao;
import com.stf.page.model.dto.Board;
import com.stf.page.model.dto.Notice;


@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticedao;
	
	// 공지사항 전체 조회
	@Override
	public List<Notice> selectList(){
		return noticedao.selectList();
	}
	
	// 공지사항 글 상세 조회
	@Override
	public Notice selectOne(int notice_index) {
		return noticedao.selectOne(notice_index);
	}

	

}
