package com.stf.page.model.service;

import java.util.List;

import com.stf.page.model.dto.Exercise;
import com.stf.page.model.dto.Program;

public interface LectureService {

	// 종목별 정보 조회
	Exercise selectExercise(String exercise);
	
	// 종목별 강의목록 조회
	List<Program> exerciseList(String exercise_name);

}
