package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Teacher_review;

public interface ReviewService {

	// 강사 리뷰 전체 조회
	List<Teacher_review> selectList();

	// 강사 리뷰 작성
	void insertBoard(Teacher_review review);

}
