package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Teacher;

public interface InstructorService {

	// 종목 강사 조회
	List<Teacher> selectList(int exercise_index);



}
