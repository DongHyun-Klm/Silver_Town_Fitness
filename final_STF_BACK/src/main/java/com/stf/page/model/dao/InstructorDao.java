package com.stf.page.model.dao;

import java.util.List;

import com.stf.page.model.dto.Teacher;

// 강사와 관련된 쿼리를 처리합니다.
public interface InstructorDao {
	
	// 종목 강사 조회
	List<Teacher> selectList(int exercise_index);
	
	
}
