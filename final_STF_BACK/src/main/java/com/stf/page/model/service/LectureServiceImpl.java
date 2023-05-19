package com.stf.page.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.stf.page.model.dao.LectureDao;
import com.stf.page.model.dto.Exercise;
import com.stf.page.model.dto.Program;

@Service
public class LectureServiceImpl implements LectureService{

	@Autowired
	private LectureDao lectureDao;
	
	// 종목별 정보 조회
	public Exercise selectExercise(String exercise){
		return lectureDao.selectExercise(exercise);
	}
	
	// 종목별 강의목록 조회
	public List<Program> exerciseList(String exercise_name) {
		return lectureDao.exerciseList(exercise_name);
	}
	

}
