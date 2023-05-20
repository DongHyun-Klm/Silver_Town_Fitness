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
	public Exercise selectExercise(int exercise_index){
		return lectureDao.selectExercise(exercise_index);
	}
	
	// 종목별 강의목록 조회
	public List<Program> exerciseList(int exercise_index) {
		return lectureDao.exerciseList(exercise_index);
	}
	

}
