package com.stf.page.model.dao;

import java.util.List;

import com.stf.page.model.dto.Teacher_review;

// 리뷰와 관련된 쿼리를 처리합니다.
public interface ReviewDao {
	
	// 강사 리뷰 조회
	List<Teacher_review> selectList(int excercise_index);
	
	// 강사 리뷰 작성
	void insertBoard(Teacher_review review);
	
}
