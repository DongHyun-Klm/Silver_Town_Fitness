package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Teacher_career;

public interface InstructorService {

	// 종목 강사 조회
	List<Teacher_career> selectList(String exercise);

	// 강사 이력 조회
	Teacher_career selectCareer(String exercise);

}
